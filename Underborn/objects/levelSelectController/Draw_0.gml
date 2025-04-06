draw_set_font(fntLoreBig);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var cx = display_get_width() / 2;
var cy = 300;

draw_text(cx, 150, "Choose Your Fate");

draw_set_font(fntLore);

if (menu_stage == 0) {
    draw_text(cx, cy - 40, "Choose Your Character:");
    for (var i = 0; i < array_length(character_options); i++) {
        var color = (i == menu_index) ? #00B200 : c_white;
        draw_set_color(color);
        draw_text(cx, cy + i * 40, character_options[i]);
    }
} else if (menu_stage == 1) {
    draw_text(cx, cy - 40, "Choose Your Path:");
    for (var i = 0; i < array_length(level_options); i++) {
        var color = (i == menu_index) ? #00B200 : c_white;
        draw_set_color(color);
        draw_text(cx, cy + i * 40, level_options[i]);
    }
} else {
    draw_set_color(c_white);
    draw_text(cx, cy, "Character:     " + selected_character);
    draw_text(cx, cy + 40, "Level:     " + selected_level);

    draw_set_color(#00B200);
    draw_text(cx, cy + 100, "Press ENTER to Begin");
}
