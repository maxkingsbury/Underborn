
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