draw_set_font(fntLore);
draw_set_color(#4C0001);
var txt1 = "Selected Save Slot:";
draw_text(150, 100, txt1);
var txt2 = string(global.selected_slot);
draw_set_font(fntLoreBig);
draw_text(300, 95, txt2);
draw_set_font(fntLore);

if (variable_global_exists("last_save_time")) {
    var txt3 = "Last saved: " + string(global.last_save_time);
    draw_set_color(#4C0001);
    draw_set_font(fntLore); 
    draw_text(display_get_gui_width() - 250, 100, txt3);
}