if (global.isPaused) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    if (mouse_check_button_pressed(mb_left)) {
        if (point_in_rectangle(mx, my, global.resume_button[0], global.resume_button[1], global.resume_button[2], global.resume_button[3])) {
            global.isPaused = false;
        }

        if (point_in_rectangle(mx, my, global.inventory_button[0], global.inventory_button[1], global.inventory_button[2], global.inventory_button[3])) {
            show_debug_message("Inventory opened (add logic)");
        }

        if (point_in_rectangle(mx, my, global.settings_button[0], global.settings_button[1], global.settings_button[2], global.settings_button[3])) {
            show_debug_message("Settings opened (add logic)");
        }

        if (point_in_rectangle(mx, my, global.exit_button[0], global.exit_button[1], global.exit_button[2], global.exit_button[3])) {
            room_goto(startRoom);
        }
    }
}

if (instance_exists(oUpgrade) || global.isPaused == true) {
    if (!is_paused) {
        is_paused = true;
        pause_start_time = current_time;
    }
} else {
    if (is_paused) {
        is_paused = false;
        pause_offset += current_time - pause_start_time;
    }
}


