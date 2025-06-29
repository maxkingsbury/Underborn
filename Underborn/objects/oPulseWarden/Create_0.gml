event_inherited();

state = "idle";
target_x = room_width / 2;
target_y = room_height / 2;

isBoss = true;

spr = sPulseWarden;
sprW = sPulseWardenWhite;

scale = 1.8;

image_xscale = scale;
image_yscale = scale;

hp = 200;

pulse_interval = 8 * game_get_speed(gamespeed_fps); // 8 seconds
alarm[0] = 1; // Start sequence immediately

// For fan attack
last_player_x = 0;
last_player_y = 0;
rand = 0;
canDrop = false;