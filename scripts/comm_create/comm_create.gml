// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function comm_create( aCanRecieveLambda, aOnRecieveLambda, aOnSendLambda, aCommRange ){
	commRange = aCommRange;
	canRecieveLambda = aCanRecieveLambda;
	onRecieveLambda = aOnRecieveLambda;
	onSendLambda = aOnSendLambda;
	active = true;
	cooldownTime = 0.3;
	messages = ds_map_create();
	comm_register();
}

function comm_terminate(){
	ds_map_destroy( messages );
}

function comm_has_message( msg ){
	return ds_map_exists( messages, message_get_id( msg ) );
}

function comm_add_message( msg ){
	ds_map_add( messages, message_get_id( msg ), msg );	
}

function comm_remove_message( msg ){
	log( "deleting message: " + message_get_id( msg ) );
	log( "before");
	v_log( ds_map_keys_to_array( messages ) );
	ds_map_delete( messages, message_get_id( msg ) );	
	log("after");
	v_log( ds_map_keys_to_array( messages ) );
}

function comm_put_on_cooldown(){
	active = false;
	delay_call_seconds( cooldownTime, comm_put_off_cooldown, [] );
}

function comm_put_off_cooldown(){
	active = true;
}

function comm_can_comm( comm ){
	return comm.active;
}

function comm_communicate( comma, commb ){
	if( not comm_can_comm( comma ) or not comm_can_comm( commb ) ){
		return;
	}
	var messagesThatCanBeSentToB = comm_get_sendable_messages( comma.messages, commb.canRecieveLambda );
	var messagesThatCanBeSentToA = comm_get_sendable_messages( commb.messages, comma.canRecieveLambda );
	// verify that there are actually messages to send.
	if( array_length_1d( messagesThatCanBeSentToA ) + array_length_1d( messagesThatCanBeSentToB ) == 0 ){
		return;
	}
	
	// actually send the messages
	comm__sendMessagesFromTo( messagesThatCanBeSentToA, commb, comma );
	comm__sendMessagesFromTo( messagesThatCanBeSentToB, comma, commb );
	
	with( comma ){
		comm_put_on_cooldown();
	}
	with( commb ){
		comm_put_on_cooldown();	
		commparticle_build( get_pos( comma ), get_pos( commb ) );
	}
}

function comm_inject_message( comm, msg ){
	with( comm ){
		comm_add_message( msg );
	}
}

function comm__sendMessagesFromTo( msgs, fromComm, toComm ){
	for( var i=0; i<array_length_1d( msgs ); i++ ){
		var msg = msgs[i];
		bindfn_lambda_execute( fromComm.onSendLambda, [ msg ] );
		bindfn_lambda_execute( toComm.onRecieveLambda, [ msg ] );
	}
}

function comm_get_sendable_messages( msgs, filterLambda ){
	var keys = ds_map_keys_to_array( msgs );
	var output = []
	for( var i=0; i<array_length_1d( keys ); i++ ){
		var msg = ds_map_find_value( msgs, keys[i] );
		if( bindfn_lambda_execute( filterLambda, [ msg ] ) ){
			v_append( output, msg );
		}
	}
	return output;
}

function comm_draw(){
	var pos = get_pos( self );
	if( is_debug() ){
		draw_set_color( c_green );
		draw_circle( v_getx( pos ), v_gety( pos ), commRange, true );	
	}
	
	var keys = ds_map_keys_to_array( messages );
	var offset = 10;
	for( var i=0; i<array_length_1d( keys ); i++ ){
		draw_text( v_getx( pos ), v_gety( pos ) + i*offset, message_toString( ds_map_find_value( messages, keys[i] ) ) );
	}
}


function comm_register(){
	comm_manager_register_comm( self );
}
