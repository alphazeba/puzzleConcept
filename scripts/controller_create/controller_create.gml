// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function controller_create(){
	delay_create();
	particlesystem_create( 200 );
	comm_manager_create();
	vip_manager_create();
	camera_manager_create();
	
	var a = buildAntenna( [ 400,400 ], 0 );
	var b = buildAntenna( [ 1000, 1000 ], 1 );
	
	comm_inject_message( a, message_build( b.antennaId, "hello there" ))
	
}

function controller_step(){
	delay_step();
	particlesystem_step();	
	comm_manager_step();
	vip_manager_step();
	camera_manager_step();
}

function controller_draw(){
	particlesystem_draw();	
}

function controller_draw_gui(){
	vip_manager_draw_gui();
}