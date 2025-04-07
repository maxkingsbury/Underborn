
// Draw dark gradient background
draw_set_color(make_color_rgb(10, 10, 30));
draw_rectangle_colour(0, 0, display_get_width(), display_get_height(),
                      make_color_rgb(100, 100, 200), make_color_rgb(0, 0, 0),
                      make_color_rgb(0, 0, 0), make_color_rgb(100, 100, 200), false);


// Draw fireflies
for (var i = 0; i < firefly_count; i++) {
    var f = fireflies[i];
    var glow = 0.5 + 0.5 * sin(degtorad(current_time / 10 + f.glow_phase)); // flicker
    draw_set_alpha(f.alpha * glow);
    draw_set_color(c_aqua); // or make_color_rgb(180, 255, 180) for softer green
    draw_circle(f.x, f.y, f.size, false);
}
draw_set_alpha(1);


// --- Draw glowing lore text ---
draw_set_font(fntLore);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Optional semi-transparent dark overlay for text contrast
draw_set_alpha(0.6);
draw_rectangle_colour(0, 0, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

//  Glow effect (draw offset text multiple times in a soft color)
var tx = display_get_width()/2;
var ty = display_get_height()/2;

draw_set_color(#3F6D7F); // glow color
for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
        if (i != 0 || j != 0) {
            draw_text(tx + i, ty + j, displayed_text);
        }
    }
}

// Draw main crisp text
draw_set_color(c_ltgrey);
draw_text(tx, ty, displayed_text);


// Draw prompt if finished
if (finished_line && input_cooldown <= 0) {
    draw_set_font(fntLoreSmall);
    draw_set_color(make_color_rgb(180, 200, 255)); // soft bluish prompt
	draw_set_alpha(0.6);
    draw_text(display_get_width()/2, display_get_height() - 150, "Press SPACE to continue...");
	draw_set_alpha(1);
}