// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buildrocket( pos, rot ){
	var newRocket = instance_create_depth( v_getx(pos), v_gety(pos), depth, rocket );
	register_vip(newRocket);
	newRocket.rot = rot;
}