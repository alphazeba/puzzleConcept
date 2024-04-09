// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function safeSurface_load(safeSurface){
	var fname = safeSurface_getName(safeSurface)+".png";
	log("loading " + fname);
	//var surfaceData = sprite_add(fname, 1,false,false,0,0);
	
	safeSurface_clean(safeSurface);
	var surface = safeSurface_buildSurface(safeSurface);
	var buffer = safeSurface_getBuffer(safeSurface);
	buffer_set_surface(buffer,surface,0);
	/*
	surface_set_target(surface);
	draw_sprite(surfaceData,0,0,0);
	surface_reset_target();
	
	sprite_delete(surfaceData);
	*/
	safeSurface_setSurface(safeSurface,surface);
	return surface;
}