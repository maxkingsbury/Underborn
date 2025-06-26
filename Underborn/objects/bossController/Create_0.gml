
// Create a global particle system
global.ptc_sys = part_system_create();
part_system_depth(global.ptc_sys, -50); // draw on top

global.ptc_waveTrail = part_type_create();
part_type_shape(global.ptc_waveTrail, pt_shape_circle);
part_type_size(global.ptc_waveTrail, 0.15, 0.3, 0, 0);
part_type_color1(global.ptc_waveTrail, make_color_rgb(200, 100, 255)); // purple
part_type_alpha2(global.ptc_waveTrail, 0.4, 0); // fades out
part_type_life(global.ptc_waveTrail, 5, 10);
part_type_speed(global.ptc_waveTrail, 0, 0, 0, 0); // doesn't move
part_type_blend(global.ptc_waveTrail, true); // additive glow

global.ptc_bulletTrail = part_type_create();
part_type_shape(global.ptc_bulletTrail, pt_shape_circle);
part_type_size(global.ptc_bulletTrail, 0.05, 0.10, 0, 0);
part_type_color1(global.ptc_bulletTrail, make_color_rgb(200, 100, 255)); // purple
part_type_alpha2(global.ptc_bulletTrail, 0.4, 0); // fades out
part_type_life(global.ptc_bulletTrail, 10, 20);
part_type_speed(global.ptc_bulletTrail, 0, 0, 0, 0); // doesn't move
part_type_blend(global.ptc_bulletTrail, true); // additive glow


global.enemiesKilled = 0;
global.coinsThisRound = 0;
global.isPaused = false;

if (instance_exists(oPlayer)) {
    // You can safely access and reset the alarms directly
    oPlayer.alarm[0] = oPlayer.swordTime;
    oPlayer.alarm[1] = oPlayer.twinbladeTime;
    oPlayer.alarm[2] = oPlayer.javelinTime;
    oPlayer.alarm[3] = oPlayer.arrowTime;
    oPlayer.alarm[4] = oPlayer.iceShardTime;
	oPlayer.alarm[5] = oPlayer.fireballTime;
}

room_start_time = current_time;
pause_offset = 0;
pause_start_time = 0;
is_paused = false;

speed = 0;

enemyHpMult = 1;

alaTime = 1;
alaTime1 = 10;

boss1_spawned = false;
alarm[1] = alaTime1;

// collecting coins
alaTime3 = 10;
alarm[3] = alaTime3;

// Inventory system
slot_count = 6;
slots = array_create(slot_count, undefined);
dragging_item = undefined;

mx = mouse_x;
my = mouse_y;

if (global.boss_to_spawn != noone) {
    instance_create_layer(room_width / 2, room_height / 2, "Instances", global.boss_to_spawn);
}
oPlayer.x = room_width / 2;
oPlayer.y = room_height / 2+100;