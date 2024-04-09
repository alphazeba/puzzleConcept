// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HoldToSkipHandler(callback){
	var input = InputAction.Ability;
	if(InputHeld(input) ){
		skipT++;
		if(skipT >= 60){
			skipT = 0;
			script_execute(callback)	
		}
	}
	else{
		skipT = 0;	
	}
}