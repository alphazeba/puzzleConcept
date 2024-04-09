// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function safeSurface_create(name,size){
	var surface = surface_create(v_getx(size), v_gety(size));
	var hasBeenChanged = false;
	var buffer = buffer_create( v_getx(size)*v_gety(size)*4, buffer_fixed, 1);
	var safeSurface = [name,size,surface,hasBeenChanged,buffer];
	safeSurface_save(safeSurface);
	return safeSurface;
}

function safeSurface_getName(safeSurface){
	return safeSurface[0];	
}

function safeSurface_getSize(safeSurface){
	return safeSurface[1];	
}

function safeSurface_getSurface(safeSurface){
	return safeSurface[2];
}

function safeSurface_setSurface(safeSurface,surface){
	safeSurface[2] = surface;	
}

function safeSurface_getHasBeenChanged(safeSurface){
	return safeSurface[3];	
}

function safeSurface_setHasBeenChanged(safeSurface, flag){
	safeSurface[3] = flag;	
}

function safeSurface_buildSurface(safeSurface){
	log("building surface " + safeSurface_getName(safeSurface));
	var size = safeSurface_getSize(safeSurface);
	var surface = surface_create(v_getx(size), v_gety(size));
	surface_set_target(surface);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
	return surface;
}

function safeSurface_getBuffer(safeSurface){
	return safeSurface[4];	
}