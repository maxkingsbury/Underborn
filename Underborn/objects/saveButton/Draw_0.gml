// Set glow effect color and intensity
var glow_color = make_color_rgb(255, 140, 0);  // Bright orange glow (change as needed)
var glow_offset = 1;  // Distance of glow from the text

// Draw the glow effect first (behind the main text)
draw_set_font(fntLoreBig);
draw_set_color(glow_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the glow by slightly offsetting the text multiple times for a blurred effect
draw_set_alpha(0.3);
draw_text(x + glow_offset, y + glow_offset, "Save");  // Bottom-right glow
draw_text(x - glow_offset, y + glow_offset, "Save");  // Bottom-left glow
draw_text(x + glow_offset, y - glow_offset, "Save");  // Top-right glow
draw_text(x - glow_offset, y - glow_offset, "Save");  // Top-left glow
draw_set_alpha(1);

// Now, draw the actual text on top (no offset, normal color)
if (hovered) {
    draw_set_color(#993000);  // Highlight color on hover
} else {
    draw_set_color(#4C0001);   // Default color
}
draw_text(x, y, "Save");

if (save_msg_timer > 0) {
    draw_set_font(fntLore);
    draw_set_color(c_lime);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_text(display_get_gui_width() / 2, 505, "Game Saved!");
}