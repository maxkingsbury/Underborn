
if (state = "pop in") {
	percent += 1/90;
	var pos = animcurve_channel_evaluate(getCurve, percent);
	
	y = y - pos;
	
	if (percent > 1) { percent = 1; state = "idle"; }
}

if (state = "go away") {
	percent -= 1/50;
	var pos = animcurve_channel_evaluate(getCurve2, percent);
	
	y = y - pos;
	
	if (percent <= 0.01) { instance_destroy(); }
}

var scale = 3;
// Adjust hover area for the scaled sprite size
var half_width = (sprite_width * scale) / 2;
var half_height = (sprite_height * scale) / 2;

// Check if mouse is hovering over this upgrade using GUI coordinates
var mouse_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 
                                       x - half_width, y - half_height, 
                                       x + half_width, y + half_height);
if (mouse_hovering) {
    // Mouse is hovering over this instance
    if (mouse_check_button_pressed(mb_left)) {
        event_user(0);
    }
}