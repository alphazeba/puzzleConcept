// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function particlesystem_create( aMaxParticles ){
	maxParticles = aMaxParticles;
	particles = linkedlist_build();
}

function particlesystem_step(){
	for( var iter = linkedlist_iter_start( particles ); linkedlist_iter_has_next( iter ); linkedlist_iter_move_next( iter ) ){
		var particle = linkedlist_iter_get( iter );
		if( particle_step( particle ) ){
			linkedlist_iter_remove( iter );	
		}
	}
}

function particlesystem_draw(){
	for( var iter = linkedlist_iter_start( particles ); linkedlist_iter_has_next( iter ); linkedlist_iter_move_next( iter ) ){
		var particle = linkedlist_iter_get( iter );
		particle_draw( particle );
	}
}

function particlesystem_add( particleStepBindfn, particleDrawBindfn ){
	var cntrl = get_controller();
	with( cntrl ){
		linkedlist_add_back( particles, particle_build( particleStepBindfn, particleDrawBindfn ) );
		if( linkedlist_get_length( particles ) > maxParticles ){
			linkedlist_remove_front( particles );
		}
	}
}

function particle_build( particleStepBindfn, particleDrawBindfn ){
	return [ particleStepBindfn, particleDrawBindfn ];	
}

function particle_step( particle ){
	return bindfn_execute( particle[0] )	
}

function particle_draw( particle ){
	bindfn_execute( particle[1] );	
}