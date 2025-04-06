

with(oEnemyParent) {
	if (sprite_index == sprW) {
		sprite_index = spr;
	}
	if (hp <= 0) { instance_destroy();}
}

alarm[1] = alaTime1;
