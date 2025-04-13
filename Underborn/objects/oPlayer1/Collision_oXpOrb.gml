if (instance_exists(oUpgrade)){ exit; }

xp += 1;
if(xp >= xpNext){
	xp = 0;
	xpNext *= 1.1;
	xpNext = round(xpNext);
	
	var _vx = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2);
	var _vy = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2);

	// Fisher–Yates shuffle the pool
	for (var i = array_length(global.upgrade_pool) - 1; i > 0; i--) {
	    var j = irandom(i);
	    var temp = global.upgrade_pool[i];
	    global.upgrade_pool[i] = global.upgrade_pool[j];
	    global.upgrade_pool[j] = temp;
	}
	

	var a = instance_create_depth(_vx, _vy, 2000, oUpgrade);
	a.destinationY = _vy;
	a.image_alpha = 1;
	a.sprite_index = global.upgrade_pool[0];
	a.depth = -2000
	
	var b = instance_create_depth(_vx, _vy, 2000, oUpgrade);
	b.destinationY = _vy - 34;
	b.image_alpha = 1;
	b.sprite_index = global.upgrade_pool[1];
	b.depth = -2000
	
	var c = instance_create_depth(_vx, _vy, 2000, oUpgrade);
	c.destinationY = _vy + 34;
	c.image_alpha = 1;
	c.sprite_index = global.upgrade_pool[2];
	c.depth = -2000
	
	
}




instance_destroy(other.id);