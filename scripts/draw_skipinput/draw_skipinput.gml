// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_skipInput(){
	if (instance_exists(Input)) {
		if (Input.inputType == Input.KEYBOARD) {
			draw_sprite(spr_skipInput,0,0,0);
		} else {
			draw_sprite(spr_skipInput,1,0,0);
		}
	}
}