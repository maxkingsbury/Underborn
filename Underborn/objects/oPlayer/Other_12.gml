/// @description Javelin
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }
var nearest_enemy = instance_nearest(x, y, oEnemyParent);
if (nearest_enemy != noone) {
    var direction_to_enemy = irandom_range(0,359); 
    
    // Determine how many javelins to create based on level
    var javelin_count = 1;
    if (javelinLevel >= 6) javelin_count = 3;
    else if (javelinLevel >= 4) javelin_count = 2;
    
    for (var j = 0; j < javelin_count; j++) {
        var angle_offset = 0;
        if (javelin_count > 1) {
            angle_offset = (j - (javelin_count-1)/2) * 20; // Spread multiple javelins
        }
        
        var projectile = instance_create_layer(x, y, "Instances", oJavelin);
        with (projectile) {
            // Apply base direction plus spread
            var spread_amount = 30;
            if (other.javelinLevel >= 3) spread_amount = 20; // Better accuracy at higher levels
            
            direction_to_enemy += angle_offset + irandom_range(-spread_amount, spread_amount);
            direction = direction_to_enemy;
            speed = 2;
            
            // Level-based improvements
            switch (other.javelinLevel) {
                case 1:
                    // Base javelin
                    max_pierce = 3;
					scale = 0.75;
                    break;
                    
                case 2:
                    max_pierce = 3;
                    dmg += 2;
					scale = 0.75;
                    break;
                    
                case 3:
                    max_pierce = 4;
                    dmg += 3;
					scale = 0.75;
                    speed = 2.5; // Faster javelin
                    break;
                    
                case 4:
                    max_pierce = 4;
                    dmg += 4;
                    speed = 2.5;
                    scale = 1; // Larger javelin
                    break;
                    
                case 5:
                    max_pierce = 5;
                    dmg += 5;
                    speed = 3;
                    scale = 1;
                    break;
                    
                case 6:
                    max_pierce = 5;
                    dmg += 6;
                    speed = 3;
                    scale = 1;
                    break;
                    
                case 7:
                    max_pierce = 6;
                    dmg += 8;
                    speed = 3.5;
                    scale = 1;
                    crit_chance = 0.2; // 20% crit chance
                    break;
            }
            
            image_angle = direction - 90; // Rotate the sprite to match movement direction
            pierce_count = 0;
        }
    }
}