// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function commparticle_build(posa, posb){
	particlesystem_add( 
		bindfn_bind( dotparticle_step, self, [ current_time + 150 ] ),
		bindfn_bind( commparticle_draw, self, [ posa, posb, c_white ] ) );
}


function commparticle_draw( posa, posb, color ){
	draw_set_color( color );
	v_draw_line( posa, posb, 1 );
}