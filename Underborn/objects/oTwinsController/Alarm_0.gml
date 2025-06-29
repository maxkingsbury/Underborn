
// Move
twin_wind.target_x1 = room_width - 100;
twin_wind.target_y1 = 100
twin_light.target_x2 = 100;
twin_light.target_y2 = room_height - 100;

fire_radial_lightning();
fire_radial_wind();

alarm[1] = game_get_speed(gamespeed_fps) * 2;
