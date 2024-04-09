// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// allows easily setting shader floats and vecs.
function shader_easySet(shader, variableName, val){
	var uniform = shader_get_uniform(shader, variableName);
	if(is_array(val)){
		var valLength = array_length_1d(val);
		if(valLength == 2){
			shader_set_uniform_f(uniform, val[0], val[1]);	
		}
		else {
			log("ERROR!!! unhandled val length of " + string(valLength) + " in the shader_easySet script!");
		}
	}
	else {
		shader_set_uniform_f(uniform,val);
	}
}