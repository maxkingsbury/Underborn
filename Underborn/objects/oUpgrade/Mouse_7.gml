// Keep your existing code but add this at the very top
show_debug_message("LEFT RELEASED ANYWHERE - checking if over oUpgrade");

if (was_clicked && point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 
                                       x - sprite_width/2, y - sprite_height/2, 
                                       x + sprite_width/2, y + sprite_height/2)) {
    show_debug_message("VALID CLICK DETECTED on " + string(id) + " - Weapon: " + weaponName);
    was_clicked = false;
    
    if (state == "idle") {
        // Your existing upgrade code here
        oUpgrade.state = "go away";
        image_blend = c_orange;
        
        var weapon_to_add = "";
        
        // Instead of hardcoding the sprite checks, we'll look up by weapon name
        if (weaponName != "") {
            weapon_to_add = weaponName;
            
            // Apply level up based on weapon name
            switch(weaponName) {
                case "Slash":
                    oPlayer.swordLevel += 1;
                    show_debug_message("Sword level up to: " + string(oPlayer.swordLevel));
                    break;
                case "Fireball":
                    oPlayer.fireballLevel += 1;
                    show_debug_message("Fireball level up to: " + string(oPlayer.fireballLevel));
                    break;
                case "Ice Shard":
                    oPlayer.iceShardLevel += 1;
                    show_debug_message("Ice Shard level up to: " + string(oPlayer.iceShardLevel));
                    break;
                case "Bow":
                    oPlayer.arrowLevel += 1;
                    show_debug_message("Arrow level up to: " + string(oPlayer.arrowLevel));
                    break;
                case "Javelin":
                    oPlayer.javelinLevel += 1;
                    show_debug_message("Javelin level up to: " + string(oPlayer.javelinLevel));
                    break;
                case "Twinblade":
                    oPlayer.twinbladeLevel += 1;
                    show_debug_message("Twinblade level up to: " + string(oPlayer.twinbladeLevel));
                    break;
            }
        }
        
        if (weapon_to_add != "") {
            var has_weapon = false;
            for (var i = 0; i < array_length(oPlayer.slot); i++) {
                if (oPlayer.slot[i] == weapon_to_add) {
                    has_weapon = true;
                    show_debug_message("Player already has " + weapon_to_add);
                    break;
                }
            }
            if (!has_weapon) {
                for (var i = 0; i < array_length(oPlayer.slot); i++) {
                    if (is_undefined(oPlayer.slot[i])) {
                        oPlayer.slot[i] = weapon_to_add;
                        show_debug_message("Added " + weapon_to_add + " to slot " + string(i));
                        break;
                    }
                }
            }
        }
    }
}