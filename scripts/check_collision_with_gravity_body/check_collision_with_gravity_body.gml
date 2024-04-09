// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_collision_with_gravity_body(){

	var bodies = get_gravityBodies()
	for( var i=0; i<array_length( bodies ) ; i++ ){
		if( v_withinDistance( get_pos( self ), get_pos( bodies[i] ), self.radius + bodies[i].radius ) ){
			return true;
		}
	}
	return false;
}