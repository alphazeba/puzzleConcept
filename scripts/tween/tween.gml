// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tween( a, b, multiplier ){
	var c = b-a;
	return a + c*multiplier;
}