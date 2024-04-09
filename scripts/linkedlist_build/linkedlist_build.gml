// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function linkedlist_build(){
	var head = undefined;
	var tail = undefined;
	var curnode = undefined;
	var length = 0;
	
	return [ head, tail, length ];
}

function linkedlist_is_empty( linkedlist ){
	return linkedlist_get_head( linkedlist ) == undefined;
}

function linkedlist_iter_build( linkedlist, head ){
	return [ linkedlist, head ]
}

function linkedlist_iter_duplicate( iter ){
	return linkedlist_iter_build( linkedlist_iter_get_linkedlist( iter ), linkedlist_iter_get_node( iter ) );	
}

function linkedlist_iter_set_node( iter, node ){
	iter[1] = node;	
}

function linkedlist_iter_get_node( iter ){
	return iter[1];	
}

function linkedlist_iter_get_linkedlist( iter ){
	return iter[0];	
}


function linkedlist_iter_start( linkedlist ){
	return linkedlist_iter_build( linkedlist, linkedlist_get_head( linkedlist ) );
}

function linkedlist_iter_has_next( iter ){
	return linkedlist_iter_get_node( iter ) != undefined;
}

function linkedlist_iter_move_next( iter ){
	var node = linkedlist_iter_get_node( iter );
	var linkedlist = linkedlist_iter_get_linkedlist( iter );
	if( node == undefined ){
		linkedlist_iter_set_node( iter, linkedlist_get_head( linkedlist ) );
	}
	else {
		linkedlist_iter_set_node( iter, linkedlist_node_get_next( node ) );
	}
}

function linkedlist_iter_get( iter ){
	return linkedlist_node_get_data( linkedlist_iter_get_node( iter ) );
}

function linkedlist_iter_remove( iter ){
	var linkedlist = linkedlist_iter_get_linkedlist( iter );
	linkedlist_length_decrement( linkedlist );
	var nodeToRemove = linkedlist_iter_get_node( iter );
	var prev = linkedlist_node_get_prev( nodeToRemove );
	var next = linkedlist_node_get_next( nodeToRemove );
	
	if( prev == undefined ){
		// we just removed the head node
		linkedlist_set_head( linkedlist, next );
	}
	else {
		linkedlist_node_set_next( prev, next );
	}
	
	if( next == undefined ){
		// we just removed the tail node
		linkedlist_set_tail( linkedlist, prev );
	}
	else {
		linkedlist_node_set_prev( next, prev );	
	}
	// prep for movenext to be called.
	linkedlist_iter_set_node( iter, prev );
}


function linkedlist_add_back( linkedlist, data ){
	linkedlist_length_increment( linkedlist );
	var node = linkedlist_node_build( data );
	if( linkedlist_is_empty( linkedlist ) ){
		linkedlist_set_head( linkedlist, node );
		linkedlist_set_tail( linkedlist, node );
	}
	else {
		var tail = linkedlist_get_tail( linkedlist );
		linkedlist_node_set_next( tail, node );
		linkedlist_node_set_prev( node, tail );
		linkedlist_set_tail( linkedlist, node );
	}
}

function linkedlist_remove_front( linkedlist ){
	if( linkedlist_is_empty( linkedlist ) ){
		return undefined;	
	}
	
	linkedlist_length_decrement( linkedlist );
	
	var oldHead = linkedlist_get_head( linkedlist );
	var newHead = linkedlist_node_get_next( oldHead );
	if( newHead == undefined ){
		linkedlist_set_head( linkedlist, undefined );
		linkedlist_set_tail( linkedlist, undefined );
	}
	else {
		linkedlist_set_head( linkedlist, newHead );	
		linkedlist_node_set_prev( newHead, undefined );
	}
	return linkedlist_node_get_data( oldHead );
}

function linkedlist_length_increment( linkedlist ){
	linkedlist[2] += 1;	
}

function linkedlist_length_decrement( linkedlist ){
	linkedlist[2] -= 1;	
}

function linkedlist_get_length( linkedlist ){
	return linkedlist[2];	
}

function linkedlist_get_head( linkedlist ){
	return linkedlist[0];	
}

function linkedlist_set_head( linkedlist, head ){
	linkedlist[0] = head;	
}

function linkedlist_get_tail( linkedlist ){
	return linkedlist[1];	
}

function linkedlist_set_tail( linkedlist, tail ){
	linkedlist[1] = tail;	
}

function linkedlist_get_curnode( linkedlist ){
	return linkedlist[2];
}

function linkedlist_set_curnode( linkedlist, curnode ){
	linkedlist[2] = curnode;	
}

function linkedlist_node_build( data ){
	return [ undefined, undefined, data ];
}

function linkedlist_node_get_data( node ){
	return node[2];	
}

function linkedlist_node_get_next( node ){
	return node[1];
}

function linkedlist_node_get_prev( node ){
	return node[0];
}

function linkedlist_node_set_next( node, next ){
	node[1] = next;
}

function linkedlist_node_set_prev( node, prev ){
	node[0] = prev;
}