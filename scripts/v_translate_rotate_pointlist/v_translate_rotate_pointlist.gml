// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function v_translate_rotate_pointlist( pointlist, translation, rotation ){
	var cosTheta = cos( rotation );
	var sinTheta = sin( rotation );
	var length = array_length_1d( pointlist );
	var tx = v_getx( translation );
	var ty = v_gety( translation );
	var output = []
	for(var i = length-1; i >-1; i--){
		var px = v_getx( pointlist[i] );
		var py = v_gety( pointlist[i] ) ;
		
		output[i] = [  
			(px * cosTheta - py * sinTheta) + tx,
			-(px * sinTheta + py * cosTheta) + ty
		];
	}
	return output;
}

function v_translate_rotate_scale_pointlist( pointlist, translation, rotation, scale ){
	var cosTheta = cos( rotation );
	var sinTheta = sin( rotation );
	var length = array_length_1d( pointlist );
	var tx = v_getx( translation );
	var ty = v_gety( translation );
	var output = []
	for(var i = length-1; i >-1; i--){
		var px = v_getx( pointlist[i] ) * scale ;
		var py = v_gety( pointlist[i] ) * scale ;
		
		output[i] = [  
			(px * cosTheta - py * sinTheta) + tx,
			-(px * sinTheta + py * cosTheta) + ty
		];
	}
	return output;
}

function v_translate_pointlist( pointlist, pos ){
	var length = array_length_1d( pointlist );
	var output = [];
	for(var i=length-1; i>-1; i-- ){
		output[i] = v_add( pointlist[i], pos );
	}
	return output;
}

function v_transpose_translate_pointlist( pointlist, unitVector, pos){
	var perp = v_perpendicular( unitVector );
	var length = array_length_1d( pointlist );
	var output = [];
	for(var i=length-1; i >-1; i-- ){
		var point = pointlist[i];
		
		output[i] = v_add(
			v_add( 
				v_multiply( unitVector, -v_getx( point ) ),
				v_multiply( perp, v_gety( point ) ) ), 
			pos );
	}
	return output;
}

function v_xyScale_pointlist( pointlist, xyScaleVector ){
	var length = array_length_1d( pointlist );
	var output = [];
	for(var i=length-1; i>-1; i-- ){
		output[i] = v_dotMultiply( pointlist[i], xyScaleVector );	
	}
	return output;
}