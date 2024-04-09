// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function v_draw_primitive( pointList, primitiveKind ){
	draw_primitive_begin( primitiveKind );
	
	for( var i=0; i< array_length(pointList); i++ ){
		draw_vertex( v_getx( pointList[i] ), v_gety( pointList[i] ) );
	}
	
	draw_primitive_end();
}