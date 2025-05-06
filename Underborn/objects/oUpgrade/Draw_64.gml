// Draw GUI Event for oUpgrade
if (!visible || state != "idle") return;

// Convert world coordinates to GUI coordinates
// This is crucial - GUI coordinates are different from world coordinates
var gui_x = display_get_gui_width() / 2;  // Center horizontally
var gui_y = display_get_gui_height() / 2;  // Scale y-position to GUI space

// Scale factor
var scale = 3;

// Draw the upgrade sprite in GUI space
draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, image_angle, image_blend, image_alpha);

// Adjust hover area for the scaled sprite size
var half_width = (sprite_width * scale) / 2;
var half_height = (sprite_height * scale) / 2;

// Check if mouse is hovering over this upgrade using GUI coordinates
var mouse_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 
                                       x - half_width, y - half_height, 
                                       x + half_width, y + half_height);

// Highlight when hovered
if (mouse_hovering) {
    // Draw highlight using GUI coordinates
    draw_sprite_ext(sprite_index, image_index, x, y, 
                   3, 3, 
                   image_angle, c_yellow, 0.5);
    
    // Draw information box using GUI coordinates
    var box_width = 380;
    var box_height = 160;
    var box_x = x + sprite_width/2 + 100;
    var box_y = y - box_height/2;
    
    // Make sure box stays on screen
    if (box_x + box_width > display_get_gui_width()) {
        box_x = x - sprite_width/2 - box_width - 10;
    }
    
    // Draw tooltip background
    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);
    
    // Draw weapon name with level
	draw_set_font(fntLoreSmall)
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    var header_text = weaponName;
    if (currentLevel > 0) {
        header_text += " (Level " + string(currentLevel+1) + ")";
    }
    
    draw_set_color(c_yellow);
    draw_text(box_x + 10, box_y + 10, header_text);
    draw_set_font(fntLoreSmaller)
    // Draw weapon description
    draw_set_color(c_white);
    draw_text_ext(box_x + 10, box_y + 35, weaponDescription, 18, box_width - 20);
    
    // Draw effect text
    draw_set_color(c_lime);
    draw_text_ext(box_x + 10, box_y + 70, effectText, 18, box_width - 20);
    
    // Draw "Click to select" prompt
    draw_set_color(c_orange);
    draw_text(box_x + 10, box_y + box_height - 25, "Click to select");
}