// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function delay_create(){
	delay_delay = [ ];
}

function delay_step(){
	var finishedIndices = [];
	for( var i=0;i<array_length_1d( delay_delay ); i++ ){
		var item = delay_delay[i];
		item[0] -= 1;
		if( item[0] <= 0 ){
			delay__execute( item );
			v_append( finishedIndices, i );
		}
	}
	delay_delay = v_remove_indices( delay_delay, finishedIndices );
}

function delay__execute( item ){
	if( instance_exists( bindfn_get_contextObj( item[1] ) ) ){
		bindfn_execute( item[1] );
	}
}

function delay_call( delayAmount, fn, args ){
	var bindfn = bindfn_bind( fn, self, args );
	var cntrl = get_controller()
	with( cntrl ){
		v_append( delay_delay, [delayAmount, bindfn ] );
	}
}


function delay_call_seconds( delaySeconds, fn, args ){
	delay_call( SecondsToFrames( delaySeconds ), fn, args );	
}