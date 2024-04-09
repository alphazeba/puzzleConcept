// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TimeInFramesToString(timeInFrames){
	var m,s,d;
	m = floor((timeInFrames / 60 / 60) mod 60);
	s = floor((timeInFrames / 60) mod 60);
	d = (timeInFrames mod 60) / 60 * 100;

	m = m < 10 ? "0" + string_format(m,1,0) : string_format(m,2,0);
	s = s < 10 ? "0" + string_format(s,1,0) : string_format(s,2,0);
	d = d < 10 ? "0" + string_format(d,1,0) : string_format(d,2,0);
	
	return m + ":" + s + ":" + d;
}