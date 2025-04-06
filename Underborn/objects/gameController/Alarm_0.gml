
with(oEnemyParent) {
	direction = point_direction(x, y, oPlayer1.x, oPlayer1.y);
	speed = walk_speed;
	
	if (oPlayer1.x > x) {image_xscale = 0.75;}
	else {image_xscale = -0.75;}
	
	depth = -y;
	
}

oPlayer1.depth = -oPlayer1.y;

alarm[0] = alaTime;

