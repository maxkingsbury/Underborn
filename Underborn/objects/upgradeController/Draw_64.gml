draw_set_font(fntLore);
draw_set_color(c_white);
draw_text(400, 320, "Given currency for testing");
draw_set_font(fntMain);
draw_set_color(c_aqua);
draw_text(400, 400, "Diamonds  " + string(round(global.diamonds)));
draw_set_color(c_yellow);
draw_text(400, 480, "Coins  " + string(round(global.coins)));

// Upgrade tree drawing
draw_set_font(fntLore);

// === First: Draw all connections ===
for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];
    for (var j = 0; j < array_length(upg.unlocks); j++) {
        var child_index = upg.unlocks[j];
        var child_upg = global.upgrades[child_index];

        if (upg.purchased) {
            draw_set_color(c_green); draw_set_alpha(0.7);
        } else if (upg.unlocked) {
            draw_set_color(c_white); draw_set_alpha(0.5);
        } else {
            draw_set_color(c_gray); draw_set_alpha(0.3);
        }

        draw_line(upg.x, upg.y, child_upg.x, child_upg.y);
        draw_set_alpha(1);
    }
}

// === Second: Draw all nodes ===
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var hovered_upgrade_index = -1;

for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];

    // Pick color based on status
    var col = c_gray;
    if (upg.level >= upg.max_level) col = c_fuchsia;
    else if (upg.level > 0) col = c_green;
    else if (upg.unlocked) col = c_white;

    // Draw circle node
    draw_set_color(col);
    draw_circle(upg.x, upg.y, 20, false);

    // Draw level number
    if (upg.level > 0) {
        draw_set_color(c_black);
        draw_set_font(fntLoreTiny);
        draw_text(upg.x - 5, upg.y - 5, string(upg.level) + "/" + string(upg.max_level));
        draw_set_font(fntLore);
    }

    // Draw name and costs
	draw_set_font(fntLore);
    draw_set_color(c_white);
    draw_text(upg.x, upg.y - 60, upg.name);

    var cost_text_color = c_yellow;
    var current_cost_coins = upg.cost_coins * power(upg.cost_multiplier, upg.level);

    if (upg.level >= upg.max_level) {
        draw_set_font(fntLoreTiny);
        draw_set_color(c_fuchsia);
        draw_text(upg.x, upg.y - 90, "MAX LEVEL");
    } else {
        draw_set_font(fntLoreTiny);

        if (global.coins < current_cost_coins) cost_text_color = c_red;
        else cost_text_color = c_yellow;

        draw_set_color(cost_text_color);
        if (current_cost_coins > 0) {
            draw_text(upg.x, upg.y - 90, string(round(current_cost_coins)) + " Coins");
        }

        if (global.diamonds < upg.cost_diamonds) cost_text_color = c_red;
        else cost_text_color = c_aqua;

        draw_set_color(cost_text_color);
        if (upg.cost_diamonds > 0) {
            draw_text(upg.x, upg.y - 110, string(upg.cost_diamonds) + " Diamond(s)");
        }
    }

    // Hover highlight
    if (point_distance(mx, my, upg.x, upg.y) < 20) {
        draw_set_color(c_yellow);
        draw_circle(upg.x, upg.y, 22, true);
        hovered_upgrade_index = i; // Save for tooltip
    }
}

// === Finally: Draw the tooltip on top ===
if (hovered_upgrade_index != -1) {
    var upg = global.upgrades[hovered_upgrade_index];
    var tooltip_x = mx;
    var tooltip_y = my;

    draw_set_color(c_dkgray);
    draw_set_alpha(1);
    draw_rectangle(tooltip_x - 120, tooltip_y + 20, tooltip_x + 120, tooltip_y + 140, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_font(fntLoreSmaller);

    var effect_desc = get_upgrade_description(hovered_upgrade_index);
    draw_text(tooltip_x, tooltip_y + 40, upg.name + " (" + string(upg.level) + "/" + string(upg.max_level) + ")");
    draw_text(tooltip_x, tooltip_y + 80, effect_desc);

    if (!upg.unlocked) {
        draw_set_color(c_red);
        draw_text(tooltip_x, tooltip_y + 120, "Locked");
    } else if (upg.level >= upg.max_level) {
        draw_set_color(c_fuchsia);
        draw_text(tooltip_x, tooltip_y + 120, "Maximum Level Reached");
    } else if (global.coins < upg.cost_coins * power(upg.cost_multiplier, upg.level) || 
               global.diamonds < upg.cost_diamonds) {
        draw_set_color(c_red);
        draw_text(tooltip_x, tooltip_y + 120, "Can't Afford");
    } else {
        draw_set_color(c_green);
        draw_text(tooltip_x, tooltip_y + 120, "Click to Purchase");
    }
}
