
draw_set_font(fntLoreBig);
draw_set_color(c_white);
draw_text_ext_transformed(50,50, instance_number(oEnemyParent), 0 ,500, 1,1,0);

var elapsed = current_time - room_start_time; // in milliseconds
var total_seconds = floor(elapsed / 1000);
var minutes = floor(total_seconds / 60);
var seconds = total_seconds mod 60;

var time_text = string(minutes) + ":" + (seconds < 10 ? "0" + string(seconds) : string(seconds));

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(display_get_gui_width() / 2, 16, time_text);


draw_set_font(fntLoreBig);
draw_set_color(c_white);
draw_text_ext_transformed(50, 50, instance_number(oEnemyParent), 0, 500, 1, 1, 0);



var slot_width = 80;
var slot_height = 80;
var slot_spacing = 15;
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var total_width = slot_count * slot_width + (slot_count - 1) * slot_spacing;
var start_x = (screen_w - total_width) / 2;
var start_y = screen_h - slot_height - 20;

for (var i = 0; i < slot_count; i++) {
    var tx = start_x + i * (slot_width + slot_spacing);
    var ty = start_y;
    draw_set_color(c_gray);
    draw_rectangle(tx, ty, tx + slot_width, ty + slot_height, false);

	if (is_struct(slots[i])) {
		var sWidth = sprite_get_width(slots[i].sprite);
		var sHeight = sprite_get_height(slots[i].sprite);
		draw_sprite_ext(slots[i].sprite, 0, tx + (((slot_width - sWidth) / 2)+5), ty + (slot_height - sHeight) / 2 + 15, 2, 2, 0, c_white, 1 );
	}
}

