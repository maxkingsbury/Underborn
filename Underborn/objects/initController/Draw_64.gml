draw_set_font(fntLore);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(display_get_gui_width()/2, 100, "Select a Save Slot");

for (var i = 0; i < 3; i++) {
    var yy = 400 + i * 80;
    var txt1 = "Slot " + string(i + 1);

    draw_set_color(c_gray);
    draw_rectangle(display_get_gui_width()/2 - 100, yy - 30, display_get_gui_width()/2 + 100, yy + 30, false);
    draw_set_color(c_white);
    draw_text(display_get_gui_width()/2, yy-15, txt1);
	
}