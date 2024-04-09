// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function phys_accelerate( obj, acceleration ){
	obj.v = v_add( obj.v, acceleration );
}