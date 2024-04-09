// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shader_set_pxlCounter(outputSize,surfaceToCount){
	var shader = pxlCounterShader;
	shader_set(shader);
	shader_easySet(shader,"outputSize",outputSize);
	shader_easySet_sampler(shader,"inputTexture",surfaceToCount);
}