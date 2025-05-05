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
    
            // Cache player state
            global.cached_sprite = sprite_index;
            global.cached_image_index = image_index;
    
            // Use display dimensions instead of camera view for GUI positioning
            // This ensures upgrades appear center screen regardless of camera position
            var view_x = display_get_gui_width() / 2;
            var view_y = display_get_gui_height() / 2;
    
            // Create a list of all weapons
            var weapon_list = ds_list_create();
            var key = ds_map_find_first(global.weapon_data);
    
            for (var i = 0; i < ds_map_size(global.weapon_data); i++) {
                ds_list_add(weapon_list, key);
                key = ds_map_find_next(global.weapon_data, key);
            }
    
            // Shuffle the list
            ds_list_shuffle(weapon_list);
    
            // Take the first 3 weapons (or fewer if there aren't enough)
            var count = min(3, ds_list_size(weapon_list));
            
            // Improved position calculation - explicitly centered on GUI screen
            var spacing = 120; // Space between upgrade options (reduced slightly)
            var start_position = view_y - ((count-1) * spacing / 2);
            
            for (var i = 0; i < count; i++) {
                var weapon_key = weapon_list[| i];
                var weapon_data = global.weapon_data[? weapon_key];
                
                // Create the upgrade object centered on screen with vertical spacing
                var upgrade = instance_create_layer(view_x, start_position + (i * spacing), "Instances", oUpgrade);
                
                // Log each upgrade's position
                upgrade.sprite_index = weapon_data.upgradeSprite;
                upgrade.depth = -2000;
                upgrade.image_alpha = 1;
                upgrade.visible = true;
        
                // Set weapon information
                upgrade.weaponName = weapon_data.name;
                upgrade.weaponDescription = weapon_data.description;
        
                // Get current level
                var currentLevel = 0;
                switch(weapon_data.name) {
                    case "Slash": currentLevel = oPlayer.swordLevel; break;
                    case "Fireball": currentLevel = oPlayer.fireballLevel; break;
                    case "Ice Shard": currentLevel = oPlayer.iceShardLevel; break;
                    case "Bow": currentLevel = oPlayer.arrowLevel; break;
                    case "Javelin": currentLevel = oPlayer.javelinLevel; break;
                    case "Twinblade": currentLevel = oPlayer.twinbladeLevel; break;
                }
        
                upgrade.currentLevel = currentLevel;
        
                // Check if player already has this weapon
                var hasWeapon = false;
                for (var j = 0; j < array_length(oPlayer.slot); j++) {
                    if (oPlayer.slot[j] == weapon_data.name) {
                        hasWeapon = true;
                        break;
                    }
                }
        
                // Set effect text
                if (!hasWeapon) {
                    upgrade.effectText = "Unlock: \n" + weapon_data.levelEffects[0];
                } else {
                    var effectIndex = min(currentLevel, array_length(weapon_data.levelEffects) - 1);
                    upgrade.effectText = "Upgrade: \n" + weapon_data.levelEffects[effectIndex];
                }
            }
    
            // Clean up
            ds_list_destroy(weapon_list);
    
        }
        
        // Destroy the orb after collection
        with (xpOrb){
            instance_destroy();
        }
    }
}

if (keyboard_check_pressed(ord("O")))
{
    with (oPickupParent)
    {
        canFly = true;
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