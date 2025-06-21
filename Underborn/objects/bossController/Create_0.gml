
room_start_time = current_time;
pause_offset = 0;
pause_start_time = 0;
is_paused = false;

if (global.boss_to_spawn != noone) {
    instance_create_layer(room_width / 2, room_height / 2, "Instances", global.boss_to_spawn);
}
oPlayer.x = room_width / 2;
oPlayer.y = room_height / 2+100;