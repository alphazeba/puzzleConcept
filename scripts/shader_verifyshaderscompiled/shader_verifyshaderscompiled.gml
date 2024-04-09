// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shader_verifyShadersCompiled(){
	var shadersToVerify = [
		[DirtOutline, "dirtOutline"],
		[pxlCounterShader,"pxlCounter shader step 1"],
		[pxlCounterShader_step2, "pxlCounter shader step2"]
	];


	log("Checking that shaders compiled ...");
	for(var i = 0; i < array_length_1d(shadersToVerify); i++){
		var shader = shadersToVerify[i][0];
		var name = shadersToVerify[i][1];
		if(!shader_is_compiled(shader)){
			log("WARNING!!! shader " + name + " did not compile!");
		}
	}
	log("finished testing shaders");
}