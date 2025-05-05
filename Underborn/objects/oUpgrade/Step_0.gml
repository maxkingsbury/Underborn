
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

/// Step Event for oUpgrade
// Debug mouse position relative to this instance
var mouse_hovering = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 
                                       x - sprite_width/2, y - sprite_height/2, 
                                       x + sprite_width/2, y + sprite_height/2);
if (mouse_hovering) {
    // Mouse is hovering over this instance
    if (mouse_check_button_pressed(mb_left)) {
        event_user(0);
    }
}