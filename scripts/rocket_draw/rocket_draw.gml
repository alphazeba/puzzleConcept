// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rocket_draw(){
	rocket_draw_at_pos( get_pos( self ) );
}

function rocket_draw_gui(){
	var screen_height = view_hport[0]
	var pos = [ 100, screen_height-100 ];
	rocket_draw_at_pos( pos );
	
	var pointer = v_xyScale_pointlist( get_arrow_points(), [ 1, sin(current_time/100) ] )
	// grav pointer
	var gravNormal = v_normalize( grav );
	var gravPointer = v_transpose_translate_pointlist( pointer, v_multiply( gravNormal, -10 ) , pos );
	draw_set_color( c_green );
	v_draw_primitive( gravPointer, pr_trianglelist );
	
	// get velocity pointer.
	var velocityNormal = v_normalize( v );
	var velocityPointer = v_transpose_translate_pointlist( pointer, v_multiply( velocityNormal, -10 ), pos );
	draw_set_color( c_blue );
	v_draw_primitive( velocityPointer, pr_trianglelist );
}

function rocket_draw_at_pos( pos ){
	var scale = 5;
	
	draw_set_color( c_white );
	v_draw_primitive(  
		v_translate_rotate_scale_pointlist( rocket_get_points() , pos, rotation, scale ),
		pr_trianglestrip );
	if( boosting ){
		draw_set_color( c_yellow );
		v_draw_primitive(  
			v_translate_rotate_scale_pointlist( rocket_get_jetPoints(), pos, rotation, scale ), 
			pr_trianglestrip );
	}
	
	draw_set_color( c_green );
	draw_circle( v_getx(pos) , v_gety(pos), radius, true );
	
	phys_draw();
}

function rocket_get_points(){
	var w = 1.4;
	var tail = -2;
	var midpoint = 1;
	var nose = 2;
	
	var points = [
		[ tail, -w/2 ],
		[ tail, w/2 ],
		[ midpoint, -w/2 ],
		[ midpoint, w/2 ],
		[ nose, 0 ],
		//[ midpoint, -w/2 ],
	];
	return points;
}

function rocket_get_jetPoints(){
	var tail = -2;
	var w = 1.1;
	var tip = 1 + sin( current_time ) * 1.3
	var points = [
		[ tail, -w/2 ],
		[ tail, w/2 ],
		[ tail - tip, 0 ]
	]
	return points
}

function get_arrow_points(){
	var offset = 1;
	var point = 2+offset;
	var mid = 1+offset;
	var tail = 0+offset;
	var w = 2;
	var points = [
		[ point, 0 ],
		[ tail, -w/2 ],
		[ mid, 0 ],		
		
		[ point, 0 ],
		[ tail, w/2 ],
		[ mid, 0 ],
	];
	return points;
}