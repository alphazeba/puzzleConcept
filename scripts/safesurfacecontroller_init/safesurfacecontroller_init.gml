// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function safeSurfaceController_init(){
	ass_safeSurfaces = [];
	ass_safeSurfaces_length = 0;
	ass_saveTimer = timer_create(30*5, safeSurfaceController_saveAll);
	timer_start(ass_saveTimer);
}