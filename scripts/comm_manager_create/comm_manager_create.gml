// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function comm_manager_create(){
	comms = linkedlist_build();
	antennas = [];
	
	delay_call_seconds( 10, comm_manager_periodic_generate_message, [] );
}

function comm_manager_periodic_generate_message(){
	// get random pointa
	// get random pointb
	// inject message into a targetting b.
	
	var a = v_getRandom( antennas );
	var b = a;
	while( a == b ){
		b = v_getRandom( antennas );	
	}
	
	comm_inject_message( a, message_build( b.antennaId, "a generated message" ) );
	
	delay_call_seconds( 5, comm_manager_periodic_generate_message, [] );
}

function comm_manager_step(){
	for( var ia = linkedlist_iter_start( comms ); linkedlist_iter_has_next( ia ); linkedlist_iter_move_next( ia ) ){
		for( var ib = linkedlist_iter_duplicate( ia ); linkedlist_iter_has_next( ib ); linkedlist_iter_move_next( ib ) ){
			var a = linkedlist_iter_get( ia );
			var b = linkedlist_iter_get( ib );
			if( not instance_exists( b ) ){
				linkedlist_iter_remove( ib );
				continue;
			}
			if( a == b ){
				continue;	
			}
			// we now know a and b exist and are different.
			if( v_withinDistance( get_pos( a ), get_pos( b ), a.commRange + b.commRange ) ){
				comm_communicate( a, b );
			}
		}
	}
}

function comm_manager_eradicate_message( msg ){
	var cntrl = get_controller();
	with( cntrl ){
		for( var iter = linkedlist_iter_start( comms ); linkedlist_iter_has_next( iter ); linkedlist_iter_move_next( iter ) ){
			var comm = linkedlist_iter_get( iter );
			if( not instance_exists( comm ) ){
				linkedlist_iter_remove( iter );
				continue;
			}
			with( comm ){
				comm_remove_message( msg );
			}
		}
	}
}

function comm_manager_register_comm( comm ){
	var cntrl = get_controller();
	with( cntrl ){
		linkedlist_add_back( comms, comm );
	}
}

function comm_manager_register_antenna( antenna ){
	var cntrl = get_controller();
	with( cntrl ){
		v_append( antennas, antenna );
	}
}
	
function vip_manager_create(){
	vips = linkedlist_build();
	satellitesCreated = 0;
	selectedNode = linkedlist_get_head(vips);
}

function vip_manager_get_new_satellite_name() {
	satellitesCreated += 1;
	return "satellite " + string(satellitesCreated);	
}

function register_vip( vip ){
	with(get_controller()){
		linkedlist_add_back(vips, vip);	
	}
}

function _vip_manager_default_node(){
	return linkedlist_get_head(vips);	
}

function _vip_manager_next_or_default_node(){
	if (selectedNode == undefined){
		return _vip_manager_default_node();	
	}
	return linkedlist_node_get_next(selectedNode);
}

function _vip_manager_prev_or_default_node(){
	if (selectedNode == undefined){
		return _vip_manager_default_node();	
	}
	return linkedlist_node_get_prev(selectedNode);
}

function _vip_manager_select(node){
	if( node == undefined ){
		return;
	}
	selectedNode = node;
}

function _vip_manager_update_follow(node){
	if (node == undefined){
		return;	
	}
	var obj = linkedlist_node_get_data(node);
	if (obj == undefined ){
		return
	}
	camera_follow(obj);
}

function vip_manager_step() {
	if( keyboard_check_pressed( ord("A") ) ){
		_vip_manager_select(_vip_manager_next_or_default_node());
		_vip_manager_update_follow( selectedNode );
	}
	if( keyboard_check_pressed( ord("S") ) ){
		_vip_manager_select(_vip_manager_prev_or_default_node());
		_vip_manager_update_follow( selectedNode );
	}
}

function vip_manager_draw_gui() {
	var drawPos = [0,0];
	var offset = [0,20];
	for( var ivip = linkedlist_iter_start( vips ); linkedlist_iter_has_next( ivip ); linkedlist_iter_move_next( ivip ) ){
		var vip = linkedlist_iter_get(ivip);
		if( not instance_exists( vip ) ) {
			linkedlist_iter_remove( ivip );
			continue;
		}
		var selected = false;
		if ( selectedNode != undefined && linkedlist_node_get_data(selectedNode) == vip ) {
			selected = true;	
		}
		var text = vip.nam;
		if ( selected ) {
			text = "> " + text;	
		}
		draw_text_pos(drawPos, text);
		drawPos = v_add(drawPos,offset);
	}
}