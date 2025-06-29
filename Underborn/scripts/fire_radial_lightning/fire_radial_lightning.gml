function fire_radial_lightning(){
	// Define lightning radial attack (8-way burst)
    for (var a = 0; a < 360; a += 45) {
        var b = instance_create_layer(oTwinLightning.x, oTwinLightning.y, "Instances", oLightningBullet);
        b.direction = a;
        b.speed = 1.5;
    }
};
