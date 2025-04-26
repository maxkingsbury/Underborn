// Script: apply_upgrade_effect
// Applies the effect of an upgrade based on its index
function apply_upgrade_effect(upgrade_index) {
    var upg = global.upgrades[upgrade_index];
    
    switch(upgrade_index) {
        case 0: // Health Up
            global.max_health += upg.effect_value;
            global.current_health += upg.effect_value;
            break;
            
        case 1: // Damage Up
            // Get the first key in the weapon_data map
			var key = ds_map_find_first(global.weapon_data);

			// Loop through all keys in the map
			while (ds_map_exists(global.weapon_data, key)) {
			    // Add the effect value to the damage property of the current weapon
			    global.weapon_data[? key].damage += upg.effect_value;
    
			    // Move to the next key
			    key = ds_map_find_next(global.weapon_data, key);
			}
            break;
            
        case 2: // Speed Up
            global.speed *= (1 + upg.effect_value);
            break;
            
        case 3: // Critical Hit
            global.crit_chance += upg.effect_value;
            break;
             
        case 4: // Dodge Boost
            global.dodge_chance += upg.effect_value;
            break;
            
        case 5: // Armor Pierce
            global.armor_penetration += upg.effect_value;
            break;
            
        case 6: // Stamina Regen
            global.stamina_regen_rate *= (1 + upg.effect_value);
            break;
            
        case 7: // Devastating Blow
            global.crit_damage_multiplier += upg.effect_value;
            break;
            
        case 8: // Counter Attack
            global.counter_attack_chance = upg.effect_value;
            break;
    }
}