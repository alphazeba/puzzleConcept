// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function timer_create(time,callback){
	return [time,time,callback,false];
}

function timer_getTime(timer){
	return timer[0];	
}

function timer_setTime(timer,time){
	timer[0] = time;
}

function timer_getClock(timer){
	return timer[1];	
}

function timer_setClock(timer,clock){
	timer[1] = clock;	
}

function timer_getCallback(timer){
	return timer[2];	
}

function timer_isRunning(timer){
	return timer[3];	
}

function timer_setIsRunning(timer,isRunning){
	timer[3] = isRunning;	
}