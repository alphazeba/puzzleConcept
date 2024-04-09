// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function satellite_create(){
	phys_create( 4 );
	comm_create_standard( 100 );
}

function satellite_step(){
	phys_step();
	
	if( check_collision_with_gravity_body() ){
		instance_destroy( self );	
	}
}

function buildSatellite( pos, rot, v ){
	var obj = instance_create_depth( v_getx(pos), v_gety(pos), depth, satellite );
	set_pos( obj, pos );
	obj.rotation = rot;
	obj.v = v;
	var name;
	with(get_controller()){
		name = vip_manager_get_new_satellite_name();	
	}
	register_vip(obj);
	obj.nam = name;
}

function satellite_draw(){
	var perp = v_perpendicular( radianToUnitVector( rotation )	);
	var pos = get_pos( self );
	var w = 20;
	var wingThick = 5;
	draw_set_color( c_white );
	draw_circle( x,y, 5, false );
	v_draw_line( v_add( pos, v_multiply( perp, w ) ), v_add( pos, v_multiply( perp, -w ) ), wingThick ); 
	phys_draw();
	comm_draw();
}