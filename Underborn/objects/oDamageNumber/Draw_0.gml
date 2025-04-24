// Set color based on whether it's a critical hit
if (is_critical) {
    draw_set_color(c_orange);
    draw_set_font(fnt_damage_big); // Create a larger font for crits
} else {
    draw_set_color(c_white);
    draw_set_font(fnt_damage); // Create a normal size font for regular damage
}

// Set alpha for fading effect
draw_set_alpha(alpha);

// Draw the damage value with a shadow for better visibility
draw_text_shadow(x, y, string(damage_value), c_black, 0.5, 0.5);

// Reset drawing properties
draw_set_alpha(1);
draw_set_color(c_white);