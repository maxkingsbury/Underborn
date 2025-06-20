// Position the nodes on the screen
for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];
    // Ensure radius and angle are set before using
	var offset_x = display_get_gui_width() / 2;
	var offset_y = display_get_gui_height() / 2;
    var radius = upg.radius;
    var angle = upg.angle;
    // Update the position of the upgrade
    upg.x = offset_x + lengthdir_x(radius, angle);
    upg.y = offset_y + lengthdir_y(radius, angle);
}

// Get mouse position in the GUI layer
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Loop through all upgrades to check for hover and click
for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];
    
    // Check if the mouse is hovering over the upgrade (within its circle)
    if (point_distance(mx, my, upg.x, upg.y) < 20) {
        // If the mouse is clicked (left click)
        if (mouse_check_button_pressed(mb_left)) {
            // Only allow clicking if it's unlocked and not at max level
            if (upg.unlocked && upg.level < upg.max_level) {
                // Calculate current cost based on level
                var current_cost_coins = upg.cost_coins * power(upg.cost_multiplier, upg.level);
                var current_cost_diamonds = upg.cost_diamonds;
                
                // Check if the player has enough resources to purchase the upgrade
                if (global.coins >= current_cost_coins && global.diamonds >= current_cost_diamonds) {
                    // Deduct the resources
                    global.coins -= current_cost_coins;
                    global.diamonds -= current_cost_diamonds;
                    
                    // Increase the level of the upgrade
                    upg.level += 1;
                    
                    // Mark as purchased if it wasn't already
                    if (!upg.purchased) {
                        upg.purchased = true;
                        
                        // Unlock any child upgrades
                        for (var c = 0; c < array_length(upg.unlocks); c++) {
                            var child_index = upg.unlocks[c];
                            global.upgrades[child_index].unlocked = true;
                        }
                    }
                    
                    // Apply the upgrade effect based on the upgrade type
                    apply_upgrade_effect(i);
                }
            }
        }
    }
}