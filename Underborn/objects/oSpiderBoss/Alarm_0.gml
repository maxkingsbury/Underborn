// Fire 3 webs inward toward oPlayer
for (var i = -1; i <= 1; i++) {
    var angle = point_direction(x, y, oPlayer.x, oPlayer.y) + i * 15;
    var web = instance_create_layer(x, y, "Instances", oSpiderWeb);
    web.direction = angle;
    web.speed = 3;
}
web_cooldown = 120; // 2 seconds between attacks
alarm[0] = web_cooldown;