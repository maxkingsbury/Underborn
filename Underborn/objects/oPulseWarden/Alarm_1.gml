// Shoot 4 projectiles in cross pattern
var dirs = [0, 90, 180, 270];
for (var i = 0; i < 4; i++) {
    var dir = dirs[i];
    var inst = instance_create_layer(x, y, "Instances", oPulseWave);
	inst.depth = -100;
    inst.direction = dir;
    inst.speed = 3;
	inst.image_angle = dir;
}

screen_shake(6, 15); 

state = "wave_shot";
alarm[2] = game_get_speed(gamespeed_fps) * 1;