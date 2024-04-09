// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fadingbackground_create(){
	drawEvent = [];
	bg = safeSurface_create( "fadingBackground", [ room_width, room_height ] );
	fadeAmount = 0.008;
}

function fadingbackground_sendDraw( bindfn ){
	var fb = get_fadingBackground();
	v_append( fb.drawEvent, bindfn ); 
}

function get_fadingBackground(){
	return fadingBackground;
}

function fadingbackground_draw(){
	var drawable = safeSurface_getDrawableSurface( bg );
	
	surface_set_target( drawable );
	
	// erase the background a bit
	draw_set_color(c_black)
	draw_set_alpha(fadeAmount);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
	
	// draw all of the events.
	for( var i=0; i<array_length_1d( drawEvent ); i++ ){
		bindfn_execute( drawEvent[i] );	
	}
	drawEvent = [];
	
	surface_reset_target();
	draw_surface( drawable, 0, 0 );
}