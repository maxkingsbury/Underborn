function fire_fan_wind(){
	// Function to fire 5 wind bullets in a fan shape

    var target_angle = point_direction(oTwinWind.x, oTwinWind.y, oPlayer.x, oPlayer.y);

    for (var i = -2; i <= 2; i++) {
        var spread_angle = target_angle + i * 10;
        var b = instance_create_layer(oTwinWind.x, oTwinWind.y, "Instances", oWindBullet);
        b.direction = spread_angle;
        b.speed = 2;
    }
};