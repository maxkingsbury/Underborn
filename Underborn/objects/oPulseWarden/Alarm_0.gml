// Move to center
target_x = room_width / 2;
target_y = room_height / 2;

state = "center_flash";
alarm[1] = game_get_speed(gamespeed_fps) * 2; // after 1 second, fire pulse