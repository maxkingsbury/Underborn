/// oPlayer - Step Event

// Pause toggle
if (keyboard_check_pressed(vk_escape)) {
    global.isPaused = !global.isPaused;
}
if (instance_exists(oUpgrade) || global.isPaused) exit;

// Movement variables
var move_x = 0;
var move_y = 0;
var is_moving = false;

// Keyboard input
var key_right = keyboard_check(ord("D"));
var key_left  = keyboard_check(ord("A"));
var key_down  = keyboard_check(ord("S"));
var key_up    = keyboard_check(ord("W"));

var hor_key = key_right - key_left;
var ver_key = key_down - key_up;

// --------------------------------------------------
// KEYBOARD MOVEMENT
// --------------------------------------------------
if (hor_key != 0 || ver_key != 0) {

    // Normalize diagonal movement
    if (hor_key != 0 && ver_key != 0) {
        var len = sqrt(hor_key * hor_key + ver_key * ver_key) * 0.9;
        hor_key /= len;
        ver_key /= len;
    }

    move_x = hor_key * mvspd;
    move_y = ver_key * mvspd;
    is_moving = true;

    // Update facing direction (dominant axis)
    if (abs(hor_key) > abs(ver_key)) {
        facing = (hor_key > 0) ? DIR.RIGHT : DIR.LEFT;
    } else {
        facing = (ver_key > 0) ? DIR.DOWN : DIR.UP;
    }
}

// --------------------------------------------------
// THUMBSTICK MOVEMENT
// --------------------------------------------------
else if (instance_exists(oThumbstick) && oThumbstick.thumb_active) {

    var move_dir = oThumbstick.thumb_direction;
    var move_amt = oThumbstick.thumb_magnitude;

    var hor = lengthdir_x(1, move_dir);
    var ver = lengthdir_y(1, move_dir);

    move_x = hor * mvspd * move_amt;
    move_y = ver * mvspd * move_amt;
    is_moving = (move_amt > 0);

    if (is_moving) {
        if (abs(hor) > abs(ver)) {
            facing = (hor > 0) ? DIR.RIGHT : DIR.LEFT;
        } else {
            facing = (ver > 0) ? DIR.DOWN : DIR.UP;
        }
    }
}

// --------------------------------------------------
// APPLY MOVEMENT (PIXEL PERFECT)
// --------------------------------------------------
x = round(x + move_x);
y = round(y + move_y);

// --------------------------------------------------
// ANIMATION SELECTION
// --------------------------------------------------
var s = global.selected_character;
var new_sprite;

if (is_moving) {
    switch (facing) {
        case DIR.DOWN:  new_sprite = s.anim_walk_down;  break;
        case DIR.UP:    new_sprite = s.anim_walk_up;    break;
        case DIR.LEFT:  new_sprite = s.anim_walk_left;  break;
        case DIR.RIGHT: new_sprite = s.anim_walk_right; break;
    }
} else {
    switch (facing) {
        case DIR.DOWN:  new_sprite = s.anim_idle_down;  break;
        case DIR.UP:    new_sprite = s.anim_idle_up;    break;
        case DIR.LEFT:  new_sprite = s.anim_idle_left;  break;
        case DIR.RIGHT: new_sprite = s.anim_idle_right; break;
    }
}

// Prevent animation reset every frame
if (sprite_index != new_sprite) {
    sprite_index = new_sprite;
    image_index = 0;
}

if (keyboard_check_pressed(ord("I"))) {
	oPlayer.xp += 10;
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
            var spacing = 200; // Space between upgrade options (reduced slightly)
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