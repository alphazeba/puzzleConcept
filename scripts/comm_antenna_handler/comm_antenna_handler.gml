// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function comm_create_antenna( commRange, antennaId ){
	comm_create(
		comm_build_antenna_can_recieve_lambda( antennaId ),
		comm_build_antenna_on_recieve_lambda(),
		comm_build_antenna_on_send_lambda(), 
		commRange );
}

function comm_build_antenna_can_recieve_lambda( antennaId ){
	return bindfn_lambda_bind( comm_antenna_can_recieve_fn, self, [ antennaId ], 1 );
}

function comm_build_antenna_on_recieve_lambda(){
	return bindfn_lambda_bind( comm_antenna_on_recieve_fn, self, [], 1 );
}

function comm_build_antenna_on_send_lambda(){
	return bindfn_lambda_bind( comm_antenna_on_send_fn, self, [], 1 );
}

function comm_antenna_can_recieve_fn( antennaId, msg ){
	return antennaId == message_get_target( msg );
}

function comm_antenna_on_recieve_fn( msg ){
	//TODO eradicate the message
	comm_manager_eradicate_message( msg );
}

function comm_antenna_on_send_fn( msg ){
	delay_call_seconds( 0.1, comm_remove_message, [ msg ] );
}
