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
draw_text(display_get_gui_width() / 2, 16, time_text);


draw_set_font(fntLoreBig);
draw_set_color(c_white);
// instance count if needed
// draw_text_ext_transformed(50, 50, instance_number(oEnemyParent), 0, 500, 1, 1, 0);

// In your GUI Draw Event (probably in the `oPlayer` or `oHUD` object)
var slot_width = 64;
var slot_height = 64;
var slot_spacing = 15;
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var slot_count = 6; // assuming 5 slots in hotbar
var total_width = slot_count * slot_width + (slot_count - 1) * slot_spacing;
var start_x = ((screen_w - total_width) / 2) + 10;
var start_y = screen_h - slot_height - 20;

var offset_x = 8;  // Move sprite to the right by 5 pixels
var offset_y = 12;  // Move sprite down by 5 pixels

for (var i = 0; i < slot_count; i++) {
    var tx = start_x + i * (slot_width + slot_spacing);
    var ty = start_y;
    draw_set_color(c_dkgray);
    draw_rectangle(tx, ty, tx + slot_width, ty + slot_height, false);

    // Draw the weapon sprite in the slot if there is a weapon
    var weapon = oPlayer.slot[i];
    if (weapon != undefined) {
        // Apply the offset (move sprite right and down)
        draw_sprite_ext(weapon.sprite, 0, tx + (slot_width - sprite_get_width(weapon.sprite)) / 2 + offset_x, 
                        ty + (slot_height - sprite_get_height(weapon.sprite)) / 2 + offset_y, 2, 2, 0, c_white, 1);
    }
}

// === XP Bar Settings ===
draw_set_font(fntLore);
var bar_x = 760;
var bar_y = display_get_gui_height() - 150;
var bar_width = 400;
var bar_height = 32;

// === XP Progress Calculation ===
var xp_ratio = clamp(oPlayer.xp / oPlayer.xpNext, 0, 1);

// === Background Bar ===
draw_set_color(c_black);
draw_rectangle(bar_x - 1, bar_y - 1, bar_x + bar_width + 1, bar_y + bar_height + 1, false);

// === Fill Bar ===
draw_set_color(c_teal);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * xp_ratio), bar_y + bar_height, false);

// === XP Text ===
draw_set_color(c_white);
draw_text(bar_x + bar_width / 2, bar_y - 5, string(oPlayer.xp) + " / " + string(oPlayer.xpNext));

draw_text(100, 100, "Press K for die");
