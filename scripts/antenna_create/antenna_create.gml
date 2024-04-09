// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function antenna_create(){
	
}

function antenna_init( antenna, commRange, aAntennaId ){
	with( antenna ){
		antennaId = aAntennaId;
		comm_create_antenna( commRange, aAntennaId );
		comm_manager_register_antenna( antenna );
	}
}

function buildAntenna( pos, aAntennaId ){
	var obj = instance_create_depth( v_getx( pos ), v_gety( pos ), depth, groundAntenna );
	antenna_init( obj, 200, aAntennaId );
	return obj;
}

function antenna_draw(){
	var pos = get_pos( self );
	draw_set_color( c_gray );
	draw_circle( v_getx( pos ), v_gety( pos ), 20, false );
	
	comm_draw();
	
	var textPos = v_add( pos, [ -10,-10 ] );
	draw_text( v_getx( textPos ), v_gety( textPos ), string( antennaId ) );
}