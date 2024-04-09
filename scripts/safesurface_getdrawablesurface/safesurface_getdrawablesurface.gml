// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function safeSurface_getDrawableSurface(safeSurface){
	var surface = safeSurface_getSurface(safeSurface);
	if(surface_exists(surface)){
		return surface;	
	}
	// else
	return safeSurface_load(safeSurface);
}