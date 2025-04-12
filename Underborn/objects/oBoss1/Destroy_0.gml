// Inherit the parent event
event_inherited();

num = random_range(7, 13);

repeat(num) {
	var offset_x = random_range(-10, 10);
	var offset_y = random_range(-10, 10);
	instance_create_layer(x + offset_x, y + offset_y, "Instances", oGoldCoinSmall)
}

instance_create_layer(x, y, "Instances", oDiamond)