// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_score_line(pos,width,leftText, rightText){
	
	var chunk = [width/2,0];
	
	var leftPos = v_add(pos, [-width/2,0]);
	var rightPos =v_add(pos, [ width/2,0]);
	var scale= 0.5;
	draw_set_halign(fa_left);
	draw_text_pos_scaled(leftPos,scale,leftText);
	draw_set_halign(fa_right);
	draw_text_pos_scaled(rightPos,scale,rightText);
}