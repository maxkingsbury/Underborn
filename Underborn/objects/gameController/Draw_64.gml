
if (instance_exists(oUpgrade)) {
	draw_set_color(c_black);
    draw_set_alpha(0.5);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
}

draw_set_font(fntLoreBig);
draw_set_color(c_white);

var actual_time = current_time;
if (is_paused) {
    actual_time = pause_start_time;
}
var elapsed = actual_time - room_start_time - pause_offset;
var total_seconds = floor(elapsed / 1000);
var minutes = floor(total_seconds / 60);
var seconds = total_seconds mod 60;

var time_text = string(minutes) + ":" + (seconds < 10 ? "0" + string(seconds) : string(seconds));

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(display_get_gui_width() / 2, display_get_gui_height() * 0.04, time_text);


draw_set_font(fntLoreBig);
draw_set_color(c_white);
// instance count if needed
// draw_text_ext_transformed(50, 50, instance_number(oEnemyParent), 0, 500, 1, 1, 0);

// Weapon slot layout
var slot_width = 64;
var slot_height = 94;
var slot_spacing = 15;
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var slot_count = 6; // assuming 5 slots in hotbar
var total_width = slot_count * slot_width + (slot_count - 1) * slot_spacing;
var start_x = ((screen_w - total_width) / 2) + 10;
var start_y = screen_h - slot_height - 20;

var offset_x = 35;  // Move sprite to the right by 5 pixels
var offset_y = 30;  // Move sprite down by 5 pixels

for (var i = 0; i < slot_count; i++) {
    var tx = start_x + i * (slot_width + slot_spacing);
    var ty = start_y;
    draw_set_color(c_dkgray);
    draw_rectangle(tx, ty, tx + slot_width, ty + slot_height, false);

    // Draw the weapon sprite in the slot if there is a weapon
	var weapon = global.weapon_data[? oPlayer.slot[i]];

    if (weapon != undefined) {
        // Apply the offset (move sprite right and down)
        draw_sprite_ext(weapon.sprite, 0, tx + (slot_width - sprite_get_width(weapon.sprite)) / 2 + offset_x, 
        ty + (slot_height - sprite_get_height(weapon.sprite)) / 2 + offset_y, 0.8, 0.8, 0, c_white, 1);
    }
}



// === XP Bar Settings ===
draw_set_font(fntLore);
var bar_width = display_get_gui_width()-100;
var bar_height = 36;
var bar_x = display_get_gui_width() / 2 - bar_width / 2;
var bar_y = 10;

// === XP Progress Calculation ===
var xp_ratio = clamp(oPlayer.xp / oPlayer.xpNext, 0, 1);

// === Background Bar ===
draw_set_color(c_black);

// Draw yellow outline (slightly larger)
draw_set_color(c_yellow);
draw_rectangle(bar_x - 2, bar_y - 2, bar_x + bar_width + 2, bar_y + bar_height + 2, false); // Outline box

// Draw actual bar (border/background/whatever you're doing next)
draw_set_color(c_black); // Or your normal bar color
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false); // Main bar

// === Fill Bar ===
draw_set_color(c_teal);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * xp_ratio), bar_y + bar_height, false);

// === XP Text ===
draw_set_color(c_white);
//draw_text(bar_x + bar_width / 2, bar_y - 5, string(oPlayer.xp) + " / " + string(oPlayer.xpNext));
draw_text(bar_x + bar_width / 2, bar_y, "Lv. " + string(oPlayer.level));


// draw weapon level text
for (var i = 0; i < 6; i++) {
    var weapon_name = oPlayer.slot[i];
    
    if (weapon_name != undefined) {
        var icon_x = start_x + i * (slot_width + slot_spacing)+30; // example layout
        var icon_y = start_y+49;

        var weapon_level = 0;

		switch (weapon_name) {
			case "Slash":      weapon_level = oPlayer.swordLevel; break;
			case "Twinblade":  weapon_level = oPlayer.twinbladeLevel; break;
			case "Javelin":    weapon_level = oPlayer.javelinLevel; break;
			case "Bow":        weapon_level = oPlayer.arrowLevel; break;
			case "Ice Shard":  weapon_level = oPlayer.iceShardLevel; break;
			case "Fireball":   weapon_level = oPlayer.fireballLevel; break;
			// Add more as needed...
		}
        // Draw the level below the icon
        draw_set_font(fntLoreSmall); // or whatever font you're using
        draw_set_halign(fa_center);
        draw_set_color(c_white);
		if (weapon_level >= 7) {
			draw_text(icon_x, icon_y + 20, "MAX");
		} else {
			draw_text(icon_x, icon_y + 20, "Lv. " + string(weapon_level));
		}
    }
}


var icon_size = 32; // size of your icons
var margin = 10;    // space between icon and number
var y_pos = display_get_gui_height() * 0.06;

// === Enemies Defeated (Left Side) ===
var x1 = display_get_gui_width()/2 - 200;

// Draw the enemy icon
draw_sprite(sEnemyIcon, 0, x1-24, (y_pos - icon_size/2) +14);

// Draw the enemy count
draw_set_font(fntLoreSmall);
draw_set_color(c_white);
draw_text(x1 + icon_size + margin, y_pos, string(global.enemiesKilled));

// === Coins (Right Side) ===
var x2 = display_get_gui_width()/2 + 200;

// Draw the coin icon
draw_sprite(sCoinIcon, 0, x2, (y_pos - icon_size/2) +28);

// Draw the coin count
draw_text(x2 + icon_size + margin, y_pos, string(global.coinsThisRound));

draw_set_font(fntLore); // Replace with your font

if (global.isPaused) {
    // Dim the screen
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    var centerX = display_get_gui_width() / 2;

    // Button dimensions
    var bw = 260;
    var bh = 140;
    var bx = centerX - (bw / 2);

    // Store Y positions for each button
    global.resume_button = [bx, 450, bx + bw, 490];
    global.exit_button = [bx, 540, bx + bw, 580];

    // Draw buttons
    draw_set_color(c_dkgray);
    draw_rectangle(bx, 455, bx + bw, 490, false);
    draw_rectangle(bx, 545, bx + bw, 580, false);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(centerX, 455, "Resume");
    draw_text(centerX, 545, "Exit to Menu");
}

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var cam = view_camera[0];
var view_x = camera_get_view_x(cam);
var view_y = camera_get_view_y(cam);
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);

with (oBossDoor) {
    margin = 50;
	var inside_x = (x > view_x + margin*2.75) && (x < view_x + view_w - margin*2.75);
	var inside_y = (y > view_y + margin) && (y < view_y + view_h - margin);
	if (inside_x && inside_y) {
	    continue;
	}

    // Hide arrow if player is very close to door
    if (point_distance(oPlayer.x, oPlayer.y, x, y) < 10) {
        continue;
    }

    var dx = x - oPlayer.x;
    var dy = y - oPlayer.y;
    var angle = point_direction(0, 0, dx, dy);

    var edge_dist = min(gui_w, gui_h) / 2 - 400; // adjust padding if needed
    var arrow_x = gui_w / 2 + lengthdir_x(edge_dist, angle);
    var arrow_y = gui_h / 2 + lengthdir_y(edge_dist, angle);

    draw_sprite_ext(sArrowIcon, 0, arrow_x, arrow_y, 2, 2, angle, c_white, 1);
}



