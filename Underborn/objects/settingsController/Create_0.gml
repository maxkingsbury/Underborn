// Settings values (use globals so they carry over)
if (!variable_global_exists("global.master_volume")) {
    global.master_volume = 1; // range 0.0 to 1.0
}
if (!variable_global_exists("global.fullscreen_enabled")) {
    global.fullscreen_enabled = window_get_fullscreen();
}

// Centered positions based on the screen size
tx = display_get_width() / 2;
ty = display_get_height() / 2;

slider_width = 300;
slider_height = 16;
slider_x = tx - slider_width / 2;  // Center the slider horizontally
slider_y = ty - 50;  // Set the vertical position (a bit above the center)