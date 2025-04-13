for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];

    // Ensure radius and angle are set before using
    var offset_x = display_get_width() / 2;
    var offset_y = display_get_height() / 2;
    var radius = upg.radius;
    var angle = upg.angle;

    // Update the position of the upgrade (no more rotating)
    upg.x = offset_x + lengthdir_x(radius, angle);
    upg.y = offset_y + lengthdir_y(radius, angle);

    // No need to modify the angle, it stays constant
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

            // Only allow clicking if it's unlocked and not yet purchased
            if (!upg.purchased && upg.unlocked) {
                // Check if the player has enough resources to purchase the upgrade
                if (global.coins >= upg.cost_coins && global.diamonds >= upg.cost_diamonds) {
                    // Deduct the resources
                    global.coins -= upg.cost_coins;
                    global.diamonds -= upg.cost_diamonds;

                    // Mark the upgrade as purchased
                    upg.purchased = true;

                    // Unlock any child upgrades
                    for (var c = 0; c < array_length(upg.unlocks); c++) {
                        var child_index = upg.unlocks[c];
                        global.upgrades[child_index].unlocked = true;
                    }
                }
            }
        }
    }
}