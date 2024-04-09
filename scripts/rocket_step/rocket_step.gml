// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rocket_step(){
	boosting = false;
	if( keyboard_check( vk_up ) ){
			phys_accelerate( self, v_multiply( radianToUnitVector( rotation ), boostPower ) );
			boosting = true;
	}
	if( keyboard_check( vk_left ) ){
		rotation += spinSpeed;	
	}
	if( keyboard_check( vk_right ) ){
		rotation -= spinSpeed;
	}
	
	phys_step();
	
	if( check_collision_with_gravity_body() ){
		rocket_reset( self );
	}
	
	if( keyboard_check_pressed( vk_space ) ){
		buildSatellite( get_pos( self ), rotation, v );	
		rocket_reset( self );
	}
}