// Spawn the twins
twin_wind = instance_create_layer(100, 100, "Instances", oTwinWind);
twin_light = instance_create_layer(room_width - 100, room_height - 100, "Instances", oTwinLightning);

state = "idle";
twin_wind.target_x1 = 100;
twin_wind.target_y1 = 100;
twin_light.target_x2 = room_width - 100;
twin_light.target_y2 = room_height - 100;

thresh = 60;

pulse_interval = 8 * game_get_speed(gamespeed_fps); // 8 seconds
alarm[0] = 1; // Start sequence immediately

// For fan attack
last_player_x = 0;
last_player_y = 0;