// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function safeSurface_clean(safeSurface){
	var surface = safeSurface_getSurface(safeSurface);
	if(surface_exists(surface)){
		surface_free(surface);
	}
}


function safeSurface_destroy(safeSurface){
	safeSurface_clean(safeSurface);
	var buffer = safeSurface_getBuffer(safeSurface);
	if(buffer_exists(buffer)){
		buffer_delete(buffer);
	}
}