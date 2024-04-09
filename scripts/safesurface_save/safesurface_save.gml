// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function safeSurface_save(safeSurface){
	var name = safeSurface_getName(safeSurface);
	var surface = safeSurface_getSurface(safeSurface);
	if(!surface_exists(surface)){
		log("uhoh, tried to save " + name + " while it didn't exist.");
		return;
	}
	
	if(name != "pxlCountFinal"){
		log("saving " +  safeSurface_getName(safeSurface));
	}
	var buffer = safeSurface_getBuffer(safeSurface);
	buffer_get_surface(buffer,surface,0);
	safeSurface_setHasBeenChanged(safeSurface,false);
}