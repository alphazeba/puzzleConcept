// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function timer_trigger(timer){
		script_execute(timer_getCallback(timer));
		timer_reset(timer);
}