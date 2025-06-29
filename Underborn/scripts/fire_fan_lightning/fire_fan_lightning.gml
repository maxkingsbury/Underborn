function fire_fan_lightning(){
// Define lightning fan attack (5 bolts spread toward player)
    var target_angle = point_direction(oTwinLightning.x, oTwinLightning.y, oPlayer.x, oPlayer.y);

    for (var i = -2; i <= 2; i++) {
        var spread_angle = target_angle + i * 10;
        var b = instance_create_layer(oTwinLightning.x, oTwinLightning.y, "Instances", oLightningBullet);
        b.direction = spread_angle;
        b.speed = 2;
    }
};