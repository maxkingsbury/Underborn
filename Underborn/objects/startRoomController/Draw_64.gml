draw_set_font(fntLore);
draw_set_color(c_white);
var txt1 = "Selected Save Slot:";
draw_text(150, 100, txt1);
var txt2 = string(global.selected_slot);
draw_set_font(fntLoreBig);
draw_text(300, 90, txt2);
draw_set_font(fntLore);