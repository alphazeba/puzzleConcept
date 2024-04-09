// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camera_manager_create(){
	res = [ 1080, 720 ];
	camera_manager_configure_window( res );
	cam = ezcam_build( res, 0 );
	followObj = undefined;
}

function camera_follow(obj) {
	with(get_controller()){
		followObj = obj;
	}
}

function camera_manager_step(){
	var follow = followObj;
	if( follow != undefined && instance_exists(follow) ){
		ezcam_set_pos( cam, get_pos( follow ) );
	}
	
	
	if( keyboard_check_pressed( ord("Q") ) ){
		camera_manager_zoomin();
	}
	if( keyboard_check_pressed( ord("W") ) ){
		camera_manager_zoomout();	
	}
}

function camera_manager_zoomout(){
	camera_manager_scale_camera( 1.1 );
}


function camera_manager_zoomin(){
	camera_manager_scale_camera( 0.9 );
}

function camera_manager_scale_camera( scaler ){
	var size = ezcam_get_size( cam );
	ezcam_set_size( cam, v_multiply( size, scaler ) );
}

function camera_manager_configure_window( res ){
	window_set_rectangle( 0,0, v_getx( res ), v_gety( res ) );
	surface_resize( application_surface, v_getx( res ), v_gety( res ) );
}

function ezcam_build( size, view ){
	view_visible[view] = true;
	view_enabled = true;
	var cam = camera_create_view( 0, 0, v_getx( size ), v_gety( size ) );
	view_camera[view] = cam;
	view_xport[view] = 0;
	view_yport[view] = 0;
	view_wport[view] = v_getx( size );
	view_hport[view] = v_gety( size );
	var pos = [ 0, 0 ];
	return [ cam, view, v_multiply( size, 0.5 ), pos ];
}

function ezcam_get_camera( ezcam ){
	return ezcam[0];	
}

function ezcam_get_view( ezcam ){
	return ezcam[1];	
}

function ezcam_get_offset( ezcam ){
	return ezcam[2];
}

function ezcam_set_offset( ezcam, offset ){
	ezcam[2] = offset;
}

function ezcam_get_pos( ezcam ){
	return ezcam[3];	
}

function ezcam_set_pos( ezcam, pos ){
	ezcam[3] = pos;
	var offsetPos = v_diff( pos, ezcam_get_offset( ezcam ) );
	camera_set_view_pos( ezcam_get_camera( ezcam ), v_getx( offsetPos ), v_gety( offsetPos ) );
}

function ezcam_get_size( ezcam ){
	var cam = ezcam_get_camera( ezcam );
	return [ camera_get_view_width( cam ), camera_get_view_height( cam ) ];
}

function ezcam_set_size( ezcam, size ){
	var cam = ezcam_get_camera( ezcam );
	camera_set_view_size( cam, v_getx( size ), v_gety( size ) );
	ezcam_set_offset( ezcam, v_multiply( size, 0.5 ) );
	ezcam_set_pos( ezcam, ezcam_get_pos( ezcam ) );
}