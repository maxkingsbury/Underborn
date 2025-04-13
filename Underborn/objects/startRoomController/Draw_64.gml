draw_set_halign(fa_left);
draw_set_font(fntLore);
draw_set_color(#4C0001);
var txt1 = "Selected Save Slot:";
draw_text(40, 100, txt1);
var txt2 = string(global.selected_slot);
draw_set_font(fntLoreBig);
draw_text(300, 95, txt2);
draw_set_font(fntLore);

if (variable_global_exists("last_save_time")) {
    var txt3 = "Last saved: " + string(global.last_save_time);
    draw_set_color(#4C0001);
    draw_set_font(fntLore); 
    draw_text(40, 150, txt3);
}
draw_set_halign(fa_center);


angle = 25;
if (angle > 360) {
	angle = 0;
}
draw_text_transformed(display_get_gui_width()/2-350, 550, "Dont forget to save!", 1, 1, angle);

