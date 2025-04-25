/// oThumbstick - Step Event
// Check for mouse press to activate thumbstick
if (mouse_check_button_pressed(mb_left) && !thumb_active) {
    // Make sure we're not clicking on a UI element or we're paused
    if (!global.isPaused && !instance_exists(oUpgrade)) {
        thumb_active = true;
        // Use GUI coordinates
        thumb_base_x = device_mouse_x_to_gui(0);
        thumb_base_y = device_mouse_y_to_gui(0);
        thumb_current_x = device_mouse_x_to_gui(0);
        thumb_current_y = device_mouse_y_to_gui(0);
    }
}

// Update thumbstick position while active
if (thumb_active) {
    if (mouse_check_button(mb_left)) {
        // Update current position to mouse position using GUI coordinates
        thumb_current_x = device_mouse_x_to_gui(0);
        thumb_current_y = device_mouse_y_to_gui(0);
        
        // Calculate distance from base
        var dist = point_distance(thumb_base_x, thumb_base_y, thumb_current_x, thumb_current_y);
        
        // Clamp distance to max
        if (dist > thumb_max_dist) {
            var dir = point_direction(thumb_base_x, thumb_base_y, thumb_current_x, thumb_current_y);
            thumb_current_x = thumb_base_x + lengthdir_x(thumb_max_dist, dir);
            thumb_current_y = thumb_base_y + lengthdir_y(thumb_max_dist, dir);
            dist = thumb_max_dist; // Update distance after clamping
        }
        
        // Calculate direction and magnitude
        thumb_direction = point_direction(thumb_base_x, thumb_base_y, thumb_current_x, thumb_current_y);
        thumb_magnitude = dist / thumb_max_dist;
    } else {
        // Mouse released, deactivate thumbstick
        thumb_active = false;
        thumb_magnitude = 0;
    }
}