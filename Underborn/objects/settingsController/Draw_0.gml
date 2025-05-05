draw_set_font(fntLore);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Title
draw_text(tx, 100, "Settings");  // Adjusted to be above the center

// Volume slider label
draw_text(tx, slider_y - 40, "Master Volume");

// Draw slider background
draw_set_color(c_dkgray);
draw_rectangle(slider_x, slider_y, slider_x + slider_width, slider_y + slider_height, false);

// Draw slider knob
draw_set_color(c_lime);
var knob_x = slider_x + (global.master_volume * slider_width);
draw_rectangle(knob_x - 4, slider_y - 4, knob_x + 4, slider_y + slider_height + 4, false);

// Fullscreen status
draw_set_color(c_white);
draw_text(tx, slider_y + 80, "Press F to toggle fullscreen: " + string(global.fullscreen_enabled));
