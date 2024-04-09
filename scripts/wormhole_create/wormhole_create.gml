// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wormhole_create(){
	all_create();
	
	radius = 25;
	delayActivateSeconds = 1;
	twinId = 0;
	twin = undefined;
	
	blocklist = [];
}


function wormhole_step(){
	
	var collisions = wormhole_getCollision();
	for( var i=0; i<array_length_1d( collisions ); i++ ){
		if( not wormhole_is_obj_blocked( collisions[i] ) ){
			wormhole_teleport_to_twin( collisions[i] );
		}
	}
}

function wormhole_is_obj_blocked( obj ){
	for( var i=0; i<array_length_1d( blocklist ); i++ ){
		if( blocklist[i] == obj.id ){
			return true;	
		}
	}
	return false;
}

function wormhole_teleport_to_twin( obj ){
	var pos = get_pos( self );
	var otherPos = get_pos( obj );
	var t = wormhole_gettwin();
	var twinPos = get_pos( t );
	var offset = v_diff( otherPos, pos );
	set_pos( obj, v_add( twinPos, offset ) )
	
	wormhole_block( obj );
	delay_call_seconds( delayActivateSeconds, wormhole_allow, [ obj ] );
}

function wormhole_getCollision(){
	var collidedObjects = [];
	var pos = get_pos( self );
	var r = radius;
	with( physObj ){
		if( v_withinDistance( get_pos( self ), pos, self.radius + r ) ){
			v_append( collidedObjects, self );	
		}
	}
	return collidedObjects;
}

function wormhole_block( obj ){
	v_append( blocklist, obj.id );
	var t = wormhole_gettwin();
	v_append( t.blocklist, obj.id );
}

function wormhole_allow( obj ){
	blocklist = v_remove_key( blocklist, obj.id );
	var t = wormhole_gettwin();
	t.blocklist = v_remove_key( t.blocklist, obj.id );
}

function wormhole_gettwin(){
	return memo_memoize( "twin", bindfn_bind( wormhole_activelyFindTwin, self, [] ) );
}

function wormhole_activelyFindTwin(){
	var twinIdToFind = twinId;
	var thisObj = self;
	with( wormhole ){
		if( self.twinId == twinIdToFind and self != thisObj ){
			return self;
		}
	}
	return undefined;
}