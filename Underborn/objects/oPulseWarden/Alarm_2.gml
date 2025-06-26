var corner = irandom(3); // 0 to 3
switch (corner) {
    case 0: // top-left
        target_x = 100;
        target_y = 100;
        break;
    case 1: // top-right
        target_x = room_width-100;
        target_y = 100;
        break;
    case 2: // bottom-left
        target_x = 100;
        target_y = room_height-100;
        break;
    case 3: // bottom-right
        target_x = room_width-100;
        target_y = room_height-100;
        break;
}

// Save player's position now for fan aim
if (instance_exists(oPlayer)) {
    last_player_x = oPlayer.x;
    last_player_y = oPlayer.y;
}

state = "move_corner";
alarm[3] = game_get_speed(gamespeed_fps) * 1; // fire fan in 1 sec