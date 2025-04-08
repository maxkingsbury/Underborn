
/// @description Enemy movement

with(oEnemyParent) {
	direction = point_direction(x, y, oPlayer1.x, oPlayer1.y);
	speed = walk_speed;
	
	if (oPlayer1.x > x) {image_xscale = scale;}
	else {image_xscale = -scale;}
	
	depth = -y;
	
}

oPlayer1.depth = -oPlayer1.y;

alarm[0] = alaTime;

