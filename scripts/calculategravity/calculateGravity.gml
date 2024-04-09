// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculateGravity( obj, body){
	var rSquared = v_sqrDistance( get_pos( obj ), get_pos( body ) );
	return get_gravity_constant() * body.mass / rSquared;
}

function draw_gravity_influence( g ){
	var r = calculate_radius_with_influence( g, self.mass );
	
	var pos = get_pos( self );
	
	var player = rocket;
	
	var unitVector = v_getUnitVectorFromTowards( get_pos( self ), get_pos( rocket ) );
	var offset = v_multiply( unitVector, r );
	
	draw_set_color( c_yellow );
	draw_circle( v_getx( pos ), v_gety( pos ), r, true );
	draw_text_pos( v_add( pos, offset ), "g:" + string_format( g, 8, 7 ) + ", r:" + string(r) );
}

function calculate_radius_with_influence( g, mass ){
	var G = get_gravity_constant();
	return sqrt( ( G * mass ) / g );
}