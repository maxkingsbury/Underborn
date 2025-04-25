/// oThumbstick - Draw GUI Event (Changed from Draw Event)
if (thumb_active) {
    // Draw base circle in GUI space
    draw_set_alpha(thumb_alpha);
    draw_set_color(thumb_base_color);
    draw_circle(thumb_base_x, thumb_base_y, thumb_base_radius, false);
    
    // Draw direction line
    draw_set_color(thumb_direction_color);
	/*
    draw_line_width(
        thumb_base_x, 
        thumb_base_y, 
        thumb_base_x + lengthdir_x(thumb_base_radius * thumb_magnitude, thumb_direction),
        thumb_base_y + lengthdir_y(thumb_base_radius * thumb_magnitude, thumb_direction),
        2
    );
	*/
    
    // Draw stick circle
    draw_set_color(thumb_stick_color);
    draw_circle(thumb_current_x, thumb_current_y, thumb_stick_radius, false);
    
    // Draw direction indicator (optional)
    draw_set_color(c_white);
    draw_set_alpha(thumb_alpha);
    draw_set_font(fntLoreSmall);
    draw_text(thumb_base_x, thumb_base_y - thumb_base_radius - 20, 
              "Direction: " + string(round(thumb_direction)));
    
    // Reset alpha
    draw_set_alpha(1.0);
}