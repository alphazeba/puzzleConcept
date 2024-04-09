// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function level1(){
	instance_create_pos( [ 1000, 1000 ], earth );
	buildrocket([0,0],0);
}

function level2(){
	var earthPos = [1000, 1000];
	var moonOffset = [ 0, -2000];
	var ins_earth = instance_create_pos( earthPos, earth );
	var ins_moon = instance_create_pos( v_add(earthPos, moonOffset), moon);
	with(ins_moon) {
		phys_body_create(ins_earth, [-5, 0] );	
	}
	buildrocket([0,0],0);
}


function instance_create_pos( pos, obj ){
	return instance_create_depth( v_getx( pos ), v_gety( pos ), depth, obj );
}