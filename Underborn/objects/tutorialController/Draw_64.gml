draw_rectangle_colour(0, 0, display_get_width(), display_get_height(),
                      #005C7F, make_color_rgb(0, 0, 0),
                      make_color_rgb(0, 0, 0), make_color_rgb(0,0,0), false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntLoreBig);

var glow_offset = 2;
var tx = display_get_width();
var ty = display_get_height();

draw_set_color(#00AEF0);
draw_set_alpha(0.4);
draw_text(tx/2 + glow_offset, ty/2-200 + 1, "Welcome to Underborn!");  // Bottom-right glow
draw_text(tx/2 - glow_offset, ty/2-200 + 1, "Welcome to Underborn!");  // Bottom-left glow
draw_text(tx/2 + glow_offset, ty/2-200 - 1, "Welcome to Underborn!");  // Top-right glow
draw_text(tx/2 - glow_offset, ty/2-200 - 1, "Welcome to Underborn!");  // Top-left glow
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(tx/2, ty/2-200, "Welcome to Underborn!")

draw_set_font(fntLore);

draw_set_color(#00AEF0);
draw_set_alpha(0.2);
draw_text(tx/2 + glow_offset, ty/2-100 + 2, "Lets go over a quick lesson on how to play");  // Bottom-right glow
draw_text(tx/2 - glow_offset, ty/2-100 + 2, "Lets go over a quick lesson on how to play");  // Bottom-left glow
draw_text(tx/2 + glow_offset, ty/2-100 - 2, "Lets go over a quick lesson on how to play");  // Top-right glow
draw_text(tx/2 - glow_offset, ty/2-100 - 2, "Lets go over a quick lesson on how to play");  // Top-left glow
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(tx/2, ty/2-100, "Lets go over a quick lesson on how to play")

// Draw the glow by slightly offsetting the text multiple times for a blurred effect
draw_set_color(#00AEF0);
draw_set_alpha(0.2);
draw_text(tx/2 + glow_offset, ty/2-40 + glow_offset, "Press WASD to move around.");  // Bottom-right glow
draw_text(tx/2 - glow_offset, ty/2-40 + glow_offset, "Press WASD to move around.");  // Bottom-left glow
draw_text(tx/2 + glow_offset, ty/2-40 - glow_offset, "Press WASD to move around.");  // Top-right glow
draw_text(tx/2 - glow_offset, ty/2-40 - glow_offset, "Press WASD to move around.");  // Top-left glow
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(tx/2, ty/2-40, "Press WASD to move around.")

draw_set_color(#00AEF0);
draw_set_alpha(0.2);
draw_text(tx/2 + glow_offset, ty/2 + glow_offset, "To select options in menu use the ARROW KEYS");  // Bottom-right glow
draw_text(tx/2 - glow_offset, ty/2 + glow_offset, "To select options in menu use the ARROW KEYS");  // Bottom-left glow
draw_text(tx/2 + glow_offset, ty/2 - glow_offset, "To select options in menu use the ARROW KEYS");  // Top-right glow
draw_text(tx/2 - glow_offset, ty/2 - glow_offset, "To select options in menu use the ARROW KEYS");  // Top-left glow
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(tx/2, ty/2, "To select options in menu use the ARROW KEYS")

draw_set_color(#00AEF0);
draw_set_alpha(0.2);
draw_text(tx/2 + glow_offset, ty/2+40 + glow_offset, "When ready to make a selection in a menu press ENTER.");  // Bottom-right glow
draw_text(tx/2 - glow_offset, ty/2+40 + glow_offset, "When ready to make a selection in a menu press ENTER.");  // Bottom-left glow
draw_text(tx/2 + glow_offset, ty/2+40 - glow_offset, "When ready to make a selection in a menu press ENTER.");  // Top-right glow
draw_text(tx/2 - glow_offset, ty/2+40 - glow_offset, "When ready to make a selection in a menu press ENTER.");  // Top-left glow
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(tx/2, ty/2+40, "When ready to make a selection in a menu press ENTER.")

draw_set_color(c_red);
draw_set_alpha(0.2);
draw_text(tx/2 + glow_offset, ty/2+100 + 5, "If something was missed locate the developer of this game and call them stupid.");  // Bottom-right glow
draw_text(tx/2 - glow_offset, ty/2+100 + 5, "If something was missed locate the developer of this game and call them stupid.");  // Bottom-left glow
draw_text(tx/2 + glow_offset, ty/2+100 - 5, "If something was missed locate the developer of this game and call them stupid.");  // Top-right glow
draw_text(tx/2 - glow_offset, ty/2+100 - 5, "If something was missed locate the developer of this game and call them stupid.");  // Top-left glow
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(tx/2, ty/2+100, "If something was missed locate the developer of this game and call them stupid.")

draw_text(tx/2, ty/2+200, "Press ENTER when you are ready to start the adventure!")