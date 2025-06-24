if (point_distance(x, y, target_x, target_y) <= speed) {
    var base_angle = random(360); // Random starting angle

    for (var i = 0; i < 5; i++) {
        var angle = base_angle + i * 72; // Rotate the spread
        var proj = instance_create_layer(x, y, "Instances", oSpiderWeb);
        proj.direction = angle;
        proj.speed = 1;
    }

    instance_destroy();
}