draw_rectangle_colour(0, 0, display_get_width(), display_get_height(),
                      make_color_rgb(255, 255, 0), make_color_rgb(0, 0, 0),
                      make_color_rgb(0, 0, 0), make_color_rgb(0,0,0), false);

draw_set_font(fntLoreBig);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var cx = display_get_width() / 2;
var cy = 300;

draw_text(cx, 150, "Choose Your Fate");

draw_set_font(fntLore);

if (menu_stage == 0) {
	draw_set_alpha(0.2);
	draw_rectangle_color(cx + 295, cy - 45, cx + 805, 605, #FFFF00, #FFFF00, #FFFF00, #FFFF00, 0);
	draw_set_alpha(1);
    draw_rectangle_color(cx + 300, cy - 40, cx + 800, 600, #363636, #363636, #363636, #363636, 0);
	
	draw_set_alpha(0.2);
	draw_rectangle_color(cx - 295, cy - 45, cx - 805, 605, #FFFF00, #FFFF00, #FFFF00, #FFFF00, 0);
	draw_set_alpha(1);
    draw_rectangle_color(cx - 300, cy - 40, cx - 800, 600, #363636, #363636, #363636, #363636, 0);
	
    draw_text(cx, cy - 40, "Choose Your Character:");

    for (var i = 0; i < array_length(character_options); i++) {
        var color = (i == menu_index) ? c_ltgrey : c_white;
        draw_set_color(color);
        draw_text(cx, cy + i * 40, character_options[i].sName);
    }

    // Draw description for the currently selected character
    draw_set_color(c_white);
	draw_set_font(fntLoreBig);
	draw_text(cx + 550, cy-40, "Description");
	draw_set_font(fntLoreSmall);
    draw_text(cx + 550, cy+40, character_options[menu_index].desc);	
	draw_set_font(fntLore);
	
	// Draw Stats for the currently selected character
    draw_set_color(c_white);
	draw_set_font(fntLoreBig);
	draw_text(cx - 550, cy-40, "Statistics");
	draw_set_font(fntLoreSmall);
    draw_text(cx - 550, cy+40, character_options[menu_index].stats);	
	draw_set_font(fntLore);
	
	// Draw instructions
    draw_set_color(c_white);
	draw_set_font(fntLore);
	draw_text(cx, cy + 600, "Use the arrow keys to select a character");
	draw_text(cx, cy + 640, "Press ENTER when ready to continue");

} 
else if (menu_stage == 1) {
	draw_set_alpha(0.2);
	draw_rectangle_color(cx + 295, cy - 45, cx + 805, 605, #FFFF00, #FFFF00, #FFFF00, #FFFF00, 0);
	draw_set_alpha(1);
    draw_rectangle_color(cx + 300, cy - 40, cx + 800, 600, #363636, #363636, #363636, #363636, 0);
	
	draw_set_alpha(0.2);
	draw_rectangle_color(cx - 295, cy - 45, cx - 805, 605, #FFFF00, #FFFF00, #FFFF00, #FFFF00, 0);
	draw_set_alpha(1);
    draw_rectangle_color(cx - 300, cy - 40, cx - 800, 600, #363636, #363636, #363636, #363636, 0);
	
    draw_text(cx, cy - 40, "Choose Your Path:");
    for (var i = 0; i < array_length(level_options); i++) {
        var color = (i == menu_index) ? c_ltgrey : c_white;
        draw_set_color(color);
        draw_text(cx, cy + i * 40, level_options[i].sName);
    }

    // Draw description for the currently selected character
    draw_set_color(c_white);
	draw_set_font(fntLoreBig);
	draw_text(cx + 550, cy-40, "Description");
	draw_set_font(fntLoreSmall);
    draw_text(cx + 550, cy+40, level_options[menu_index].desc);
	draw_set_font(fntLore);
	
	// Draw Stats for the currently selected character
    draw_set_color(c_white);
	draw_set_font(fntLoreBig);
	draw_text(cx - 550, cy-40, "Statistics");
	draw_set_font(fntLoreSmall);
    draw_text(cx - 550, cy+40, level_options[menu_index].stats);	
	draw_set_font(fntLore);
	
	// Draw instructions
    draw_set_color(c_white);
	draw_set_font(fntLore);
	draw_text(cx, cy + 600, "Use the arrow keys to select a level");
	draw_text(cx, cy + 640, "Press ENTER when ready to continue");

} 
else {
    draw_set_color(c_white);
    draw_text(cx, cy, "Character:     " + global.selected_character.sName);
    draw_text(cx, cy + 40, "Level:     " + global.selected_level.sName);
    draw_text(cx, cy + 200, "Press ENTER to Begin");
}
