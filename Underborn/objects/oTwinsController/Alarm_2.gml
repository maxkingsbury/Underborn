// Move to center
twin_wind.target_x1 = room_width/2-60;
twin_wind.target_y1 = room_height/2
twin_light.target_x2 = room_width/2+60;
twin_light.target_y2 = room_height/2;

fire_fan_lightning();
fire_fan_wind();

alarm[0] = game_get_speed(gamespeed_fps) * 3; // after 1 second, fire pulse

