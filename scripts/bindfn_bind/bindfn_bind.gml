// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bindfn_bind( fn, contextObj, args ){
	return bindfn_lambda_bind( fn, contextObj, args, 0 );
}

function bindfn_lambda_bind( fn, contextObj, args, numInputs ){
	return [ fn, contextObj, args, numInputs ]
}

function bindfn_execute( bindfn ){
	if( bindfn[3] != 0 ){
		throw( "this is a lambda function, it cannot be executed as a bindfn" );
	}
	var fn = bindfn[0];
	var contextObj = bindfn[1];
	var args = bindfn[2];
	return bindfn__actualExecute( fn, contextObj, args );
}

function bindfn_lambda_execute( bindfn, input ){
	if( bindfn[3] != array_length_1d( input ) ){
		throw( "lambda execute was not given the correct number of inputs" );
	}
	var fn = bindfn[0];
	var contextObj = bindfn[1];
	var args = v_concat( bindfn[2], input );
	return bindfn__actualExecute( fn, contextObj, args );
}

function bindfn__actualExecute( fn, contextObj, args ){
	var numArgs = array_length_1d( args );
	with( contextObj ){
		switch( numArgs ){
			case 0:
				return script_execute( fn );
			case 1:
				return script_execute( fn, args[0] );
			case 2:
				return script_execute( fn, args[0], args[1] );
			case 3:
				return script_execute( fn, args[0], args[1], args[2] );
			case 4:
				return script_execute( fn, args[0], args[1], args[2], args[3] );
			default:
				log( "bind fn wasn't built to accept this number of arguments" );
				throw( numArgs );
		}
	}
	return;
}

function bindfn_get_contextObj( bindfn ){
	return bindfn[1];	
}