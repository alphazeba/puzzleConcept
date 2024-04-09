// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_pos(pos, text){
	draw_text(v_getx(pos),v_gety(pos), text);
}

function draw_text_pos_scaled(pos,scale,text){
	draw_text_transformed(v_getx(pos), v_gety(pos),text,scale,scale,0);	
}