if (instance_exists(oUpgrade)){ exit; }

xp += 1;
if(xp >= xpNext){
	xp = 0;
	xpNext += 1;
	
	
	var _vx = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2);
	var _vy = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2);
	
	
	var a = instance_create_depth(_vx, _vy, 2000, oUpgrade);
	a.destinationY = _vy;
	a.image_alpha = 1;
	a.sprite_index = sUpgradeTest;
	a.depth = -2000
	
	var b = instance_create_depth(_vx, _vy, 2000, oUpgrade);
	b.destinationY = _vy - 34;
	b.image_alpha = 1;
	b.sprite_index = sUpgradeTest_1;
	b.depth = -2000
	
	var c = instance_create_depth(_vx, _vy, 2000, oUpgrade);
	c.destinationY = _vy + 34;
	c.image_alpha = 1;
	c.sprite_index = sUpgradeTest_2;
	c.depth = -2000
}


instance_destroy(other.id);