
var rand = random(1);


repeat (num) {
	if (rand < 0.5) {
		var offset_x = random_range(-5, 5);
	    var offset_y = random_range(-5, 5);
		instance_create_layer(x, y, "Instances", oXpOrb)
	}
}