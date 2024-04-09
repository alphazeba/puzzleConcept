// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function safeSurfaceController_unloadAll(){
	for(var i=0;i<ass_safeSurfaces_length;i++){
		var safeSurface = ass_safeSurfaces[i];
		safeSurface_clean(safeSurface);
	}
}