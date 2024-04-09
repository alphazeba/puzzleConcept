// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function v_remove_indices( vector, sortedIndices ){
	var outputSize = array_length_1d( vector ) - array_length_1d( sortedIndices );
	if( outputSize == array_length_1d( vector ) ){
		return vector;	
	}
	if( outputSize == 0 ){
		return [];	
	}
	var currentIndex = 0;
	var removeTarget = sortedIndices[ currentIndex ];
	var vectorIndex = 0;
	var output = []
	output[ outputSize-1 ] = 0;
	for( var i=0;i<outputSize; i++ ){
		while( vectorIndex == removeTarget ){
			vectorIndex++;
			currentIndex++;
			if( currentIndex < array_length_1d( sortedIndices ) ){
				removeTarget = sortedIndices[ currentIndex ];	
			}
		}
		output[i] = vector[ vectorIndex ];
		vectorIndex++;
	}
	return output;
}

function v_remove_key( vector, key ){
	var indicesToRemove = [];
	for( var i=0; i< array_length_1d( vector ); i++ ){
		if( vector[i] == key ){
			v_append( indicesToRemove, i );	
		}
	}
	
	return v_remove_indices( vector, indicesToRemove );
}