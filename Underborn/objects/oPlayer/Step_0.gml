
if (instance_exists(oUpgrade)){ exit; }
if (!instance_exists(oUpgrade)) {
	// Movement input
	var left = keyboard_check(ord("A"));
	var right = keyboard_check(ord("D"));
	var up = keyboard_check(ord("W"));
	var down = keyboard_check(ord("S"));

	var hor = right - left;
	var vertical = down - up;

	// Apply movement
	x += hor * mvspd;
	y += vertical * mvspd;

	// Flip sprite based on horizontal direction
	if (hor > 0) image_xscale = 1;
	if (hor < 0) image_xscale = -1;

	// Set sprite based on movement
	var c = global.selected_character;
	if (hor != 0 || vertical != 0) {
		sprite_index = c.anim_walk;
	}
	else { 
		sprite_index = c.anim_idle;
	}
}

if (keyboard_check(ord("K"))) {
	room_goto(startRoom);
}

// Check if the player is touching the XP orb (or near it)
if (place_meeting(x, y, oXpOrb)) {
    var xpOrb = instance_place(x, y, oXpOrb); // Find the XP orb instance
    
    if (xpOrb != noone) {
        // Collect the XP
        oPlayer.xp += 1;
        if (oPlayer.xp >= oPlayer.xpNext) {
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
	
			var a = instance_create_depth(_vx, _vy, 2000, oUpgrade);
			a.destinationY = _vy;
			a.image_alpha = 1;
			a.sprite_index = global.upgrade_pool[0];
			a.depth = -2000
	
			var b = instance_create_depth(_vx, _vy, 2000, oUpgrade);
			b.destinationY = _vy - 34;
			b.image_alpha = 1;
			b.sprite_index = global.upgrade_pool[1];
			b.depth = -2000
	
			var c = instance_create_depth(_vx, _vy, 2000, oUpgrade);
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