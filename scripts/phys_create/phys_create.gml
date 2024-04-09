// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function phys_create( aRadius ){
	v = [ 0,0 ];
	grav = [ 0,0 ];
	radius = aRadius;
	rotation = 0;
	delay_call_seconds( 0.2, periodic_create_trail, [] );
}

function phys_body_create( aAnchorBody, av ){
	// a body will already have radius set.
	grav = [ 0,0 ];
	anchorBody = aAnchorBody;
	v = av
}

function periodic_create_trail(){
	dotparticle_build( get_pos( self ) );
	delay_call_seconds( 0.2, periodic_create_trail, [] );
}