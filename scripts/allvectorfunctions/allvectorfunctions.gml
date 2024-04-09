
/// @desc v_apply(function,va,vb)
/// @param function
/// @param va
/// @param vb
function v_apply() {
	var fn = argument[0];
	var numInputs = argument_count-1;
	var length = array_length_1d(argument[1]);
	var vector = [];
	switch(numInputs){
		case 1:
			var a = argument[1];
			for(var i = length-1; i >-1; i--){
				vector[i] = script_execute(fn,a[i]);
			}
			break;
		case 2:
			var a = argument[1];
			var b = argument[2];
			for(var i = length-1; i >-1; i--){
				vector[i] = script_execute(fn,a[i],b[i]);
			}
			break;
		case 3:
			var a = argument[1];
			var b = argument[2];
			var c = argument[3];
			for(var i = length-1; i >-1; i--){
				vector[i] = script_execute(fn,a[i],b[i],c[i]);
			}
			break;
		default:
			log("running a script with " + string(length) + " operators is not accounted for");
	}
	return vector;
}

/// @desc v_apply(function,vector, parama, paramb)
/// @param function
/// @param vector
/// @param parama
/// @param paramb

function v_apply_single_vector() {
	var fn = argument[0];
	var vector = argument[1];
	var numInputs = argument_count-2;
	var length = array_length_1d(vector);
	var output = [];
	switch(numInputs){
		case 0:
			for(var i = length-1; i >-1; i--){
				output[i] = script_execute(fn, vector[i] );
			}
			break;
		case 1:
			var a = argument[2];
			for(var i = length-1; i >-1; i--){
				output[i] = script_execute(fn, vector[i], a);
			}
			break;
		case 2:
			var a = argument[2];
			var b = argument[3];
			for(var i = length-1; i >-1; i--){
				output[i] = script_execute(fn, vector[i], a, b);
			}
			break;
		case 3:
			var a = argument[2];
			var b = argument[3];
			var c = argument[4];
			for(var i = length-1; i >-1; i--){
				output[i] = script_execute(fn, vector[i], a, b, c);
			}
			break;
		default:
			log("running a script with " + string(length) + " parameters is not accounted for");
	}
	return output;
}

/// @desc v_concat(vectora,vectorb)
/// @param vectora
/// @param vectorb
function v_concat(argument0, argument1) {
	var va = argument0;
	var vb = argument1;
	var alength = array_length_1d(va);
	var blength = array_length_1d(vb);
	var vector = [];

	array_copy(vector,alength,vb,0,blength);
	array_copy(vector,0,va,0,alength);

	return vector;
}


function v_append(vector, value){
	var length = array_length_1d(vector);
	vector[length] = value;
}

/// @desc v_diff(vectora,vectorb)
/// @param vectora
/// @param vectorb
function v_diff(va, vb) {
	var length = array_length_1d(va);
	var vector = [];
	for(var i = length-1; i > -1; i--){
			vector[i] = va[@i]-vb[@i];
	}
	return vector;


}

/// @desc v_distance(vectora,vectorb)
/// @param vectora
/// @param vectorb
function v_distance(argument0, argument1) {
	return sqrt(v_sqrDistance(argument0,argument1));


}

/// @desc v_dotMultiply(vectora,vectorb)
/// @param vectora
/// @param vectorb
function v_dotMultiply(argument0, argument1) {
	var va = argument0;
	var vb = argument1;
	var length = array_length_1d(va);
	var vector = [];
	for(var i = length-1; i > -1; i--){
			vector[i] = va[@i] * vb[@i];
	}
	return vector;


}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function v_draw_line(va,vb,width){
	draw_line_width(v_getx(va),v_gety(va),v_getx(vb),v_gety(vb),width);
}

function v_draw_line_color(va,vb,width,color){
	draw_set_color(color);
	v_draw_line(va,vb,width);
}

function v_getMouse() {
	return [mouse_x,mouse_y];
}

/// @desc v_getx(vector)
/// @param vector
function v_getx(vector) {
	return vector[@0];
}

/// @desc v_gety(vector)
/// @param vector
function v_gety(vector) {
	return vector[@1];
}

/// @desc v_length(vector)
/// @param vector
function v_length(vector) {
	return sqrt(v_sqrLength(vector));
}

/// @desc v_multiply(vectora,multiplier)
/// @param vector
/// @param multiplier
function v_multiply(argument0, argument1) {
	var v = argument0;
	var m = argument1;
	var length = array_length_1d(v);
	var vector = [];
	for(var i = length-1; i > -1; i--){
			vector[i] = v[@i] * m;
	}
	return vector;


}

/// @desc v_normalize(vector)
/// @param vector
function v_normalize(vector) {
	var length = v_length(vector);
	return v_multiply(vector,1/length);
}

/// @desc v_set(vector,x,y)
/// @param vector
/// @param x
/// @param y
function v_set() {
	var vector = argument[0];
	var length = argument_count-1;
	for(var i = 0; i < length; i++){
			vector[@i] = argument[i+1];
	}
}

/// @desc v_setx(vector,x)
/// @param vector
/// @param x
function v_setx(vector, value) {
	vector[@0] = value;
}

/// @desc v_sety(vector,y)
/// @param vector
/// @param y
function v_sety(vector, value) {
	vector[@1] = value;
}

/// @desc v_sqrDistance(vectora,vectorb)
/// @param vectora
/// @param vectorb
function v_sqrDistance(va, vb) {
	var diff = v_diff(va,vb);
	return v_sqrLength(diff);
}

/// @desc v_sqrLength(vector)
/// @param vector
function v_sqrLength(vector) {
	return v_sum(v_dotMultiply(vector,vector));
}

/// @desc v_sum(vector)
/// @param vector
function v_sum(vector) {
	var length = array_length_1d(vector);
	var output = 0;
	for(var i = length-1; i > -1; i--){
		output += vector[i];
	}
	return output;
}

function v_tween(va, vb, multiplier) {
	var diff = v_diff(vb,va);
	return v_add(va, v_multiply(diff,multiplier));
}

/// @desc v_add(vectora,vectorb)
/// @param vectora
/// @param vectorb
function v_add(va, vb) {
	var length = array_length_1d(va);
	var vector = [];
	for(var i = length-1; i > -1; i--){
			vector[i] = va[@i] + vb[@i];
	}
	return vector;
}

function v_getRandom(vector){
	var length = array_length_1d(vector);
	var randomIndex = irandom(length-1)
	return vector[randomIndex];
}

function v_toString(vector){
	var result = "[";
	var length = array_length_1d(vector);
	for(var i=0;i<length;i++){
		result += string(vector[i]);
		if(i != length-1){
			result += ",";	
		}
	}
	return result + "]";
}

function v_log(vector){
	log(v_toString(vector));	
}

function v_floor(vector){
	return v_apply(s_floor,vector);
}


function v_withinDistance(va,vb,distance){
	var sqrLength = v_sqrDistance(va,vb);
	return sqrLength < distance*distance;
	
}

function v_getUnitVectorFromTowards( fromPos, towardPos ){
	return v_normalize( v_diff( towardPos, fromPos ) );
}