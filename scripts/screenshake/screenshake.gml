// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenShake(amt,time){
	if (!instance_exists(Camera))
		exit;
	
	with(Camera) {
		shakeAmt = amt >= shakeAmt ? amt : shakeAmt;
		shakeT = amt >= shakeAmt ? time : shakeT;
	}
}