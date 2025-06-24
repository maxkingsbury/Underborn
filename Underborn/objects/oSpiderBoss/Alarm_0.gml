if (hp > 50) {
    // Fire 3 webs at player
    for (var i = -1; i <= 1; i++) {
        var angle = point_direction(x, y, oPlayer.x, oPlayer.y) + i * 15;
        var web = instance_create_layer(x, y, "Instances", oSpiderWeb);
        web.direction = angle;
        web.speed = 2;
    }
    web_cooldown = 120;
}
else {
    // Fire a spider bomb toward the center
	var angle = point_direction(x, y, room_width/2, room_height/2)
    var bomb = instance_create_layer(x, y, "Instances", oSpiderBomb);
	bomb.direction = angle;
	bomb.speed = 2;
    web_cooldown = 60;
}

alarm[0] = web_cooldown;