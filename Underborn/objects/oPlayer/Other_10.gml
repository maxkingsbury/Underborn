// Check if the player is touching the XP orb (or near it)
if (place_meeting(x, y, oXpOrb)) {
    var xpOrb = instance_place(x, y, oXpOrb); // Find the XP orb instance
    
    if (xpOrb != noone) {
        // Collect the XP
        oPlayer.xp += 1;
        // Replace your existing upgrade spawn code with this:
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

			// Create 3 upgrades with proper information
			for (var i = 0; i < 3; i++) {
			    var upgrade = instance_create_depth(_vx, _vy, -2000, oUpgrade);
			    upgrade.sprite_index = global.upgrade_pool[i];
			    upgrade.image_alpha = 1;
			    upgrade.depth = -2000;
        
			    // Position the upgrade
			    if (i == 0) {
			        upgrade.destinationY = _vy; // Middle
			    } else if (i == 1) {
			        upgrade.destinationY = _vy - 34; // Top
			    } else {
			        upgrade.destinationY = _vy + 34; // Bottom
			    }
        
			    // Set weapon information based on sprite
			    for (var key = variable_struct_get_names(global.weapons); key != undefined; key = variable_struct_next(global.weapons, key)) {
			        var weapon = variable_struct_get(global.weapons, key);
			        if (weapon.sprite == upgrade.sprite_index) {
			            upgrade.weaponName = weapon.name;
			            upgrade.weaponDescription = weapon.description;
                
			            // Get current level of this weapon
			            var currentLevel = 0;
			            switch(weapon.name) {
			                case "Slash": currentLevel = oPlayer.swordLevel; break;
			                case "Fireball": currentLevel = oPlayer.fireballLevel; break;
			                case "Ice Shard": currentLevel = oPlayer.iceShardLevel; break;
			                case "Bow": currentLevel = oPlayer.arrowLevel; break;
			                case "Javelin": currentLevel = oPlayer.javelinLevel; break;
			                case "Twinblade": currentLevel = oPlayer.twinbladeLevel; break;
			            }
                
			            upgrade.currentLevel = currentLevel;
			            upgrade.nextLevel = min(currentLevel + 1, array_length(weapon.levelEffects) - 1);
                
			            // Get effect text for current level
			            var hasWeapon = false;
			            for (var j = 0; j < array_length(oPlayer.slot); j++) {
			                if (oPlayer.slot[j] == weapon.name) {
			                    hasWeapon = true;
			                    break;
			                }
			            }
                
			            if (!hasWeapon) {
			                upgrade.effectText = "Unlock: " + weapon.levelEffects[0];
			            } else {
			                upgrade.effectText = "Upgrade: " + weapon.levelEffects[min(currentLevel, array_length(weapon.levelEffects) - 1)];
			            }
			            break;
			        }
			    }
			}
		}

        // Destroy the orb or hide it after collection
		with (xpOrb){
			instance_destroy();
		}
    }
}