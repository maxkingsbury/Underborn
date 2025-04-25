// Script: get_upgrade_description
// Returns a description of what an upgrade does
function get_upgrade_description(upgrade_index) {
    var upg = global.upgrades[upgrade_index];
    var current_effect = upg.effect_value * upg.level;
    var next_effect = upg.effect_value * (upg.level + 1);
    
    switch(upgrade_index) {
        case 0: // Health Up
            return "Current: +" + string(current_effect) + " HP\nNext: +" + string(next_effect) + " HP";
            
        case 1: // Damage Up
            return "Current: +" + string(current_effect) + " DMG\nNext: +" + string(next_effect) + " DMG";
            
        case 2: // Speed Up
            var current_percent = current_effect * 100;
            var next_percent = next_effect * 100;
            return "Current: +" + string(current_percent) + "% SPD\nNext: +" + string(next_percent) + "% SPD";
            
        case 3: // Critical Hit
            var current_percent = current_effect * 100;
            var next_percent = next_effect * 100;
            return "Current: +" + string(current_percent) + "% Crit\nNext: +" + string(next_percent) + "% Crit";
            
        case 4: // Dodge Boost
            var current_percent = current_effect * 100;
            var next_percent = next_effect * 100;
            return "Current: +" + string(current_percent) + "% Dodge\nNext: +" + string(next_percent) + "% Dodge";
            
        case 5: // Armor Pierce
            var current_percent = current_effect * 100;
            var next_percent = next_effect * 100;
            return "Current: +" + string(current_percent) + "% Armor Pierce\nNext: +" + string(next_percent) + "% Armor Pierce";
            
        case 6: // Stamina Regen
            var current_percent = current_effect * 100;
            var next_percent = next_effect * 100;
            return "Current: +" + string(current_percent) + "% Stamina Regen\nNext: +" + string(next_percent) + "% Stamina Regen";
            
        case 7: // Devastating Blow
            var current_percent = current_effect * 100;
            return "+" + string(current_percent) + "% Critical Damage";
            
        case 8: // Counter Attack
            var current_percent = current_effect * 100;
            return string(current_percent) + "% Counter Attack on Dodge";
    }
    
    return "No description available";
}