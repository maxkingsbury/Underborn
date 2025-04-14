draw_set_font(fntMain);
draw_set_color(c_aqua);
draw_text(400, 400, "Diamonds  " + string(global.diamonds));
draw_set_color(c_yellow);
draw_text(400, 480, "Coins  " + string(global.coins));

// Draw the upgrade tree with nodes and connections
draw_set_font(fntLore);
draw_set_color(c_white);

// Iterate through the upgrades and draw them
for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];

    // Draw the upgrade node
    var col = c_gray;
    if (upg.purchased) col = c_lime;
    else if (upg.unlocked) col = c_white;

    // Draw the node
    draw_set_color(col);
    draw_circle(upg.x, upg.y, 20, false);

    // Draw the upgrade name
    draw_set_color(c_white);
    draw_text(upg.x, upg.y - 60, upg.name);
	draw_set_font(fntLoreSmall);
	draw_set_color(c_yellow);
	draw_text(upg.x, upg.y - 90, string(upg.cost_coins) + " Coins");
	draw_set_color(c_aqua);
	draw_text(upg.x, upg.y - 110, string(upg.cost_diamonds) + " Diamond(s)");
	draw_set_font(fntLore);
	draw_set_color(c_white);
	
    // Draw lines to child nodes
    for (var j = 0; j < array_length(upg.unlocks); j++) {
        var child_index = upg.unlocks[j];
        var child_upg = global.upgrades[child_index];
        draw_set_color(c_white);
		draw_set_alpha(0.5);
        draw_line(upg.x, upg.y, child_upg.x, child_upg.y);
		draw_set_alpha(1);
    }

    // Hover highlight effect
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (point_distance(mx, my, upg.x, upg.y) < 20) {
        draw_set_color(c_yellow);
        draw_circle(upg.x, upg.y, 22, true);
    }
}
