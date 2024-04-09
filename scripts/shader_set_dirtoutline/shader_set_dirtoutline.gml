// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shader_set_DirtOutline(size){
	var shader = DirtOutline;
	shader_set(shader);
	shader_easySet(shader, "size", size);
	shader_easySet(shader, "time", current_time);
}