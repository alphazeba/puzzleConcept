// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function _get_grav_from_body(body) {
	var gravDir = v_normalize( v_diff( get_pos( body ), get_pos( self ) ) )
	return v_multiply( gravDir, calculateGravity( self, body ) );
}

function _update_position( grav ) {
	phys_accelerate( self, grav );
	var pos = get_pos( self );
	var newPos = v_add( pos, v );
	set_pos( self, newPos );
}

function phys_step(){
	grav = [ 0, 0 ];
	var bodies = get_gravityBodies();
	for( var i=0; i < array_length( bodies ); i++ ){
		grav = v_add( grav, _get_grav_from_body( bodies[i] ));
	}
	_update_position( grav );
}

function phys_body_step() {
	grav = _get_grav_from_body( anchorBody );
	_update_position( grav );
}