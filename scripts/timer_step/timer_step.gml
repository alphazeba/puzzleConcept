// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function timer_step(timer){
	if(!timer_isRunning(timer)){
		return;	
	}
	
	var clock = timer_getClock(timer);
	clock--;
	if(clock < 0){
		timer_trigger(timer);
	}
	else{
		timer_setClock(timer,clock);	
	}
}