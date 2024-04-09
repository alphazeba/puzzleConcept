// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_gravity( pos, grav ){
	if( not is_debug() ){
		return	
	}
	
	var scale = 100;
	
	v_draw_line_color( pos, v_add( pos, v_multiply( grav, scale ) ), 2, c_green );
	
}