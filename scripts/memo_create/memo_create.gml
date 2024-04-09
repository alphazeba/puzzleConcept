// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function memo_create(){
	memo = ds_map_create();
}

function memo_terminate(){
	ds_map_destroy( memo );
}

function memo_write( key,item ){
	ds_map_add( memo, key, item );
}

function memo_read( key ){
	return ds_map_find_value( memo, key );
}

function memo_exists( key ){
	return ds_map_exists( memo, key );
}

function memo_memoize( key, bindfn ){
	if( memo_exists( key ) ){
		return memo_read( key );	
	}
	var result = bindfn_execute( bindfn );
	memo_write( key, result );
	return result;
}