draw_set_font(fntMain);
draw_set_color(c_aqua);
draw_text(400, 400, "Diamonds  " + string(global.diamonds));
draw_set_color(c_yellow);
draw_text(400, 480, "Coins  " + string(global.coins));

// Draw the upgrade tree with nodes and connections
draw_set_font(fntLore);
draw_set_color(c_white);

// First draw all connections
for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];
    // Draw lines to child nodes
    for (var j = 0; j < array_length(upg.unlocks); j++) {
        var child_index = upg.unlocks[j];
        var child_upg = global.upgrades[child_index];
        // Draw with different colors based on status
        if (upg.purchased) {
            draw_set_color(c_lime);
            draw_set_alpha(0.7);
        } else if (upg.unlocked) {
            draw_set_color(c_white);
            draw_set_alpha(0.5);
        } else {
            draw_set_color(c_gray);
            draw_set_alpha(0.3);
        }
        draw_line(upg.x, upg.y, child_upg.x, child_upg.y);
        draw_set_alpha(1);
    }
}

// Then draw all nodes so they appear on top of the lines
for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];
    
    // Determine node color based on status
    var col = c_gray;
    if (upg.level >= upg.max_level) col = c_fuchsia; // Maxed out
    else if (upg.level > 0) col = c_lime; // Purchased at least once
    else if (upg.unlocked) col = c_white; // Unlocked but not purchased
    
    // Draw the node
    draw_set_color(col);
    draw_circle(upg.x, upg.y, 20, false);
    
    // Draw level indicator if purchased
    if (upg.level > 0) {
        draw_set_color(c_black);
        draw_set_font(fntLoreTiny);
        draw_text(upg.x - 5, upg.y - 5, string(upg.level) + "/" + string(upg.max_level));
        draw_set_font(fntLore);
    }
    
    // Draw the upgrade name
    draw_set_color(c_white);
    draw_text(upg.x, upg.y - 60, upg.name);
    
    // Calculate current costs based on level
    var cost_text_color = c_yellow;
    var current_cost_coins = upg.cost_coins * power(upg.cost_multiplier, upg.level);
    
    // If max level is reached, show "MAX" instead of costs
    if (upg.level >= upg.max_level) {
        draw_set_font(fntLoreTiny);
        draw_set_color(c_fuchsia);
        draw_text(upg.x, upg.y - 90, "MAX LEVEL");
    } else {
        // Show current cost that will be applied for the next purchase
        draw_set_font(fntLoreTiny);
        
        // Show coin cost in red if can't afford
        if (global.coins < current_cost_coins) cost_text_color = c_red;
        else cost_text_color = c_yellow;
        
        draw_set_color(cost_text_color);
        draw_text(upg.x, upg.y - 90, string(round(current_cost_coins)) + " Coins");
        
        // Show diamond cost in red if can't afford
        if (global.diamonds < upg.cost_diamonds) cost_text_color = c_red;
        else cost_text_color = c_aqua;
        
        draw_set_color(cost_text_color);
        draw_text(upg.x, upg.y - 110, string(upg.cost_diamonds) + " Diamond(s)");
    }
    
    draw_set_font(fntLore);
    draw_set_color(c_white);
    
    // Hover highlight effect and tooltip
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (point_distance(mx, my, upg.x, upg.y) < 20) {
        draw_set_color(c_yellow);
        draw_circle(upg.x, upg.y, 22, true);
        
        // Show tooltip
        var tooltip_x = mx;
        var tooltip_y = my;
        draw_set_color(c_black);
        draw_set_alpha(0.8);
        draw_rectangle(tooltip_x - 100, tooltip_y - 10, tooltip_x + 120, tooltip_y + 50, false);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_set_font(fntLoreTiny);
        
        // Show different descriptions based on the upgrade type
        var effect_desc = get_upgrade_description(i);
        draw_text(tooltip_x, tooltip_y, upg.name + " (" + string(upg.level) + "/" + string(upg.max_level) + ")");
        draw_text(tooltip_x, tooltip_y + 40, effect_desc);
        
        // Show "Locked" if not unlocked
        if (!upg.unlocked) {
            draw_set_color(c_red);
            draw_text(tooltip_x, tooltip_y + 80, "Locked");
        }
        // Show "Max Level" if maxed
        else if (upg.level >= upg.max_level) {
            draw_set_color(c_fuchsia);
            draw_text(tooltip_x, tooltip_y + 80, "Maximum Level Reached");
        }
        // Show "Can't Afford" if unlocked but too expensive
        else if (global.coins < upg.cost_coins * power(upg.cost_multiplier, upg.level) || 
                global.diamonds < upg.cost_diamonds) {
            draw_set_color(c_red);
            draw_text(tooltip_x, tooltip_y + 80, "Can't Afford");
        }
        // Show "Click to Purchase" if can buy
        else {
            draw_set_color(c_lime);
            draw_text(tooltip_x, tooltip_y + 80, "Click to Purchase");
        }
    }
}