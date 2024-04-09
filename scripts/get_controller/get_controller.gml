// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_controller(){
	return memo_memoize( "cntrl", bindfn_bind( actively_get_controller, self, [] ) );
}

function actively_get_controller(){
	return controller;	
}