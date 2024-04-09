// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_gravityBodies(){
	return memo_memoize( "gravityBody", bindfn_bind( actively_get_gravity_bodies, self, [] ) )
}

function actively_get_gravity_bodies(){
	var bodies = []
	with( gravityBody ){
		v_append( bodies, self );	
	}
	return bodies;
}