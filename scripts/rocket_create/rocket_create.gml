// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rocket_create(){
	phys_create( 4 );
	boostPower = 0.2;
	spinSpeed = pi/50;
	boosting = false;
	nam = "rocket";
}