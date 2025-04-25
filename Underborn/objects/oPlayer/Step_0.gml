/// oPlayer - Step Event
if (keyboard_check_pressed(vk_escape)) {
    global.isPaused = !global.isPaused;
}
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

// Variables to store movement input
var move_x = 0;
var move_y = 0;
var is_moving = false;

// Check for keyboard (WASD) input first
var key_right = keyboard_check(ord("D"));
var key_left = keyboard_check(ord("A"));
var key_down = keyboard_check(ord("S"));
var key_up = keyboard_check(ord("W"));

// Calculate keyboard movement (horizontal and vertical)
var hor_key = key_right - key_left;
var ver_key = key_down - key_up;

// If there's keyboard input, use it
if (hor_key != 0 || ver_key != 0) {
    // Normalize diagonal movement
	if (hor_key != 0 && ver_key != 0) {
	    var len = (sqrt(hor_key * hor_key + ver_key * ver_key))*0.9;
	    hor_key = (hor_key / len);
	    ver_key = (ver_key / len);
	}
    
    // Apply keyboard movement
    move_x = hor_key * mvspd;
    move_y = ver_key * mvspd;
    is_moving = true;
    
    // Flip sprite based on horizontal direction
    if (hor_key > 0) image_xscale = 1;
    if (hor_key < 0) image_xscale = -1;
}
// If no keyboard input but thumbstick is active, use thumbstick
else if (instance_exists(oThumbstick) && oThumbstick.thumb_active) {
    // Get direction and magnitude from thumbstick
    var move_dir = oThumbstick.thumb_direction;
    var move_amount = oThumbstick.thumb_magnitude;
    
    // Calculate horizontal and vertical components
    var hor = lengthdir_x(1, move_dir);
    var ver = lengthdir_y(1, move_dir);
    
    // Apply movement (already normalized through direction calculation)
    move_x = hor * mvspd * move_amount;
    move_y = ver * mvspd * move_amount;
    is_moving = (move_amount > 0);
    
    // Flip sprite based on horizontal direction
    if (hor > 0) image_xscale = 1;
    if (hor < 0) image_xscale = -1;
}

// Apply the calculated movement
x = round(x + move_x);
y = round(y + move_y);

// Set sprite based on movement
var s = global.selected_character;
if (is_moving) {
    sprite_index = s.anim_walk;
} else {
    sprite_index = s.anim_idle;
}

// Check if the player is touching the XP orb (or near it)
if (place_meeting(x, y, oXpOrb)) {
    var xpOrb = instance_place(x, y, oXpOrb); // Find the XP orb instance
    
    if (xpOrb != noone) {
        // Collect the XP
        oPlayer.xp += 1;
        if (oPlayer.xp >= oPlayer.xpNext) {
			oPlayer.level += 1;
            oPlayer.xp -= oPlayer.xpNext;
            oPlayer.xpNext *= 1.1;
            oPlayer.xpNext = round(oPlayer.xpNext);
			
			global.cached_sprite = sprite_index;
			global.cached_image_index = image_index;
            
            var _vx = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2);
			var _vy = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2);

			// Fisher–Yates shuffle the pool
			for (var i = array_length(global.upgrade_pool) - 1; i > 0; i--) {
			    var j = irandom(i);
			    var temp = global.upgrade_pool[i];
			    global.upgrade_pool[i] = global.upgrade_pool[j];
			    global.upgrade_pool[j] = temp;
			}
	
			var a = instance_create_depth(_vx, _vy, -2000, oUpgrade);
			a.destinationY = _vy;
			a.image_alpha = 1;
			a.sprite_index = global.upgrade_pool[0];
			a.depth = -2000
	
			var b = instance_create_depth(_vx, _vy, -2000, oUpgrade);
			b.destinationY = _vy - 34;
			b.image_alpha = 1;
			b.sprite_index = global.upgrade_pool[1];
			b.depth = -2000
	
			var c = instance_create_depth(_vx, _vy, -2000, oUpgrade);
			c.destinationY = _vy + 34;
			c.image_alpha = 1;
			c.sprite_index = global.upgrade_pool[2];
			c.depth = -2000
        }

        // Destroy the orb or hide it after collection
		with (xpOrb){
			instance_destroy();
		}
    }
}

image_speed = instance_exists(oUpgrade) ? 0 : 1;

// Handle any active status effects from accessories
if (shield_timer > 0) {
    shield_timer -= 1/60; // Countdown based on seconds
    has_shield = true;
} else {
    has_shield = false;
}