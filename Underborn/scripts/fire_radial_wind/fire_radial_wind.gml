function fire_radial_wind() {
	// Function to fire 8 wind bullets in all directions
    for (var a = 0; a < 360; a += 45) {
        var b = instance_create_layer(oTwinWind.x, oTwinWind.y, "Instances", oWindBullet);
        b.direction = a;
        b.speed = 1.5;
    }
};