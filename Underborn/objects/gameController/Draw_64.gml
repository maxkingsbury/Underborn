
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


// Setting for weapon boxes
var box_width = 64;
var box_height = 64;
var spacing = 10;
var total_boxes = 6;

// Calculate total width of the entire UI bar
var total_width = (box_width * total_boxes) + (spacing * (total_boxes - 1));

// Get screen dimensions
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();

// Starting X and Y positions (centered horizontally, near bottom vertically)
var start_x = (screen_w - total_width) / 2;
var start_y = screen_h - box_height - 20; // 20px padding from bottom

// Draw the 6 boxes
for (var i = 0; i < total_boxes; i++) {
    var x1 = start_x + i * (box_width + spacing);
    var y1 = start_y;
    var x2 = x1 + box_width;
    var y2 = y1 + box_height;
    
    draw_set_color(c_white);
    draw_rectangle(x1, y1, x2, y2, false); // false = not filled (outline only)
}