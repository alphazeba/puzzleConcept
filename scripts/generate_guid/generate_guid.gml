// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_guid(){
	var output = string( current_time );
	for( var i=0; i<10; i++ ){
		output += choose("0", "1", "2", "3", "4", "5", "6", "7",
        "8", "9", "A", "B", "C", "D", "E", "F");
	}
	return output;
}