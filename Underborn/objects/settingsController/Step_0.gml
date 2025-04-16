// Update master volume based on slider drag
if (mouse_check_button(mb_left)) {
    var mx = device_mouse_x(0);
    var my = device_mouse_y(0);
    
    if (mx > slider_x && mx < slider_x + slider_width && abs(my - slider_y) < 20) {
        global.pct = (mx - slider_x) / slider_width;
        global.master_volume = clamp(global.pct, 0, 1);
        audio_master_gain(global.master_volume);
    }
}

// Toggle fullscreen with F key (optional)
if (keyboard_check_pressed(ord("F"))) {
    global.fullscreen_enabled = !global.fullscreen_enabled;
    window_set_fullscreen(global.fullscreen_enabled);
}
