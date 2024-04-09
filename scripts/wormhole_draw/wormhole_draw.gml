// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wormhole_draw(){
	/*  // maybe in the future draw the womrhole deactivated if its not active for the rocket.
	if( active ){
		draw_set_color( c_white );
	}
	else {
		draw_set_color( c_gray );	
	}
	*/
	draw_set_color( c_white );
	draw_circle( x, y, radius, true );
}