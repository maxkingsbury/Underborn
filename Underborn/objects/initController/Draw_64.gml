draw_set_font(fntLoreBig);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(display_get_gui_width()/2, 250, "Select a Save Slot");
draw_set_font(fntLore);

for (var i = 0; i < 3; i++) {
    var yy = 400 + i * 80;
    var txt1 = "Slot " + string(i + 1);

    draw_set_color(c_gray);
    draw_rectangle_colour(display_get_gui_width()/2 - 100, yy - 30, display_get_gui_width()/2 + 100, yy + 30, c_dkgrey, c_black, c_dkgrey, c_black, false);
    draw_set_color(c_white);
    draw_text(display_get_gui_width()/2, yy-15, txt1);
	
}