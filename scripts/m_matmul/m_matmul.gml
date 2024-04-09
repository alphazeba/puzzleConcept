// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function m_matmul( ma, mb ){
	var mar = m_getrows( ma );
	var mac = m_getcols( ma );
	var mbr = m_getrows( mb );
	var mbc = m_getrows( mb );
	
	if( mac != mbr ){
		log( "ERROR! invalid matmul row and col of the things aren't the same" );
		log( mac );
		log( mbr );
	}
	
	var output = [];
	
	for(var r = mar-1; r >-1; r--){
		var row = []
		for(var c = mbc-1; c >-1; c--){
			var sum = 0;
			for(var i=mac-1; i >-1; i--){
				sum += ma[r][i] * mb[i][c];
			}
			row[c] = sum;
		}
		output[r] = row;
	}
	
	return output;
}


function m_getrows( m ){
	return array_length_1d( m );	
}

function m_getcols( m ){
	return array_length_1d( m[0] );	
}