
with(oEnemyParent) {
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	speed = walk_speed;
	
	if (oPlayer.x > x) {image_xscale = 1;}
	else {image_xscale = -1;}
	
	depth = -y;
	
}

oPlayer.depth = -oPlayer.y;

alarm[0] = alaTime;

