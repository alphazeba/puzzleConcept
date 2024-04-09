// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function comm_create_standard( commRange ){
	comm_create( 
		comm_build_standard_can_recieve_lambda(), 
		comm_build_standard_on_recieve_lambda(), 
		comm_build_standard_on_send_lambda(), 
		commRange )	
}


function comm_build_standard_can_recieve_lambda(){
	return bindfn_lambda_bind( comm_standard_can_recieve_fn, self, [], 1 );	
}

function comm_build_standard_on_recieve_lambda(){
	return bindfn_lambda_bind( comm_standard_on_recieve_fn, self, [], 1 );
}

function comm_build_standard_on_send_lambda(){
	return bindfn_lambda_bind( comm_standard_on_send_fn, self, [], 1 );	
}

function comm_standard_can_recieve_fn( msg ){
	return not comm_has_message( msg );
}

function comm_standard_on_recieve_fn( msg ){
	comm_add_message( msg );
}

function comm_standard_on_send_fn( msg ){
	return;	
}