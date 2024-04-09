// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shader_easySet_sampler(shader, variableName, surface){
	var samplerId = shader_get_sampler_index(shader,variableName);
	var tex = surface_get_texture(surface);
	texture_set_stage(samplerId, tex);
}