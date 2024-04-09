// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_pos( obj_optional ){
	if( obj_optional == undefined ){
		return [ self.x, self.y ]	
	}
	return [ obj_optional.x, obj_optional.y ]
}
