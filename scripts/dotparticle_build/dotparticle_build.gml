// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dotparticle_build( pos ){
	particlesystem_add( 
		bindfn_bind( dotparticle_step, self, [ current_time + getRandomLifeSpan() ] ),
		bindfn_bind( dotparticle_draw, self, [ pos, c_white ] ) );
}

function getRandomLifeSpan(){
	var n = random(1);
	return tween( 6, 4, n*n ) * 1000;	
}

function dotparticle_step( dieTime ){
	return current_time > dieTime;
}

function dotparticle_draw( pos, color ){
	draw_set_color( color );
	draw_circle( v_getx( pos ), v_gety( pos ), 1, false );
}