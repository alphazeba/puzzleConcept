// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function message_build( aTarget, aContent ){
	return [ message_generate_id(), aTarget, aContent ];
}

function message_generate_id(){
	return generate_guid();
}

function message_get_id( msg ){
	return msg[0];	
}

function message_get_target( msg ){
	return msg[1];	
}

function message_get_content( msg ){
	return msg[2];	
}

function message_toString( msg ){
	return  message_get_id( msg ) + " target: " + string( message_get_target( msg ) );	
}