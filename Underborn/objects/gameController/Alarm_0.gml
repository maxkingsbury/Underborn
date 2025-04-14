
/// @description Enemy movement


if (instance_exists(oUpgrade)) {
    oEnemyParent.image_speed = 0;
    alarm[0] = 1;
    exit;
}

with(oEnemyParent) {
	if (instance_exists(oUpgrade)) { image_speed = 0; }
	image_speed = 1;
	mp_potential_step(oPlayer.x, oPlayer.y, walk_speed, false);
	
	if (oPlayer.x > x) {image_xscale = scale;}
	else {image_xscale = -scale;}
	
	depth = -y;
	
}



oPlayer.depth = -oPlayer.y;

alarm[0] = alaTime;

