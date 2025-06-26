// Fire 5 bullets in a fan toward last known player pos
var base_dir = point_direction(x, y, last_player_x, last_player_y);
var spread = 15;

for (var i = -2; i <= 2; i++) {
    var angle = base_dir + i * spread;
    var inst = instance_create_layer(x, y, "Instances", oPulseBullet);
    inst.direction = angle;
	inst.image_angle = angle;
    inst.speed = 2;
}

state = "fan_attack";
alarm[4] = game_get_speed(gamespeed_fps) * 2; // pause after