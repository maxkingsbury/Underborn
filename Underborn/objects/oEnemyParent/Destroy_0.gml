global.enemiesKilled += 1;
var rand = random(1);

// Clean up the ds_list when the enemy is destroyed
ds_list_destroy(hit_by_projectiles);

repeat (num) {
	if (rand < 0.5) {
		var offset_x = random_range(-5, 5);
	    var offset_y = random_range(-5, 5);
		instance_create_layer(x, y, "Instances", oXpOrb)
	}
}