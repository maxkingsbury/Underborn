/// @description Arrow
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }
var nearest_enemy = instance_nearest(x, y, oEnemyParent);
if (nearest_enemy != noone) {
    var direction_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
    
    // Determine number of arrows based on level
    var arrow_count = 1;
    if (arrowLevel >= 7) arrow_count = 5;
    else if (arrowLevel >= 5) arrow_count = 3;
    else if (arrowLevel >= 3) arrow_count = 2;
    
    for (var a = 0; a < arrow_count; a++) {
        var angle_offset = 0;
        if (arrow_count > 1) {
            angle_offset = (a - (arrow_count-1)/2) * 15; // Spread multiple arrows
        }
        
        var projectile = instance_create_layer(x, y, "Instances", oArrow);
        with (projectile) {
            // Apply base direction with improved accuracy based on level
            var spread = 5;
            if (other.arrowLevel >= 4) spread = 3; // Better accuracy
            
            direction_to_enemy += angle_offset + irandom_range(-spread, spread);
            direction = direction_to_enemy;
            
            // Level-based improvements
            switch (other.arrowLevel) {
                case 1:
                    // Base arrow
                    speed = 3;
                    max_pierce = 1;
                    break;
                    
                case 2:
                    speed = 3.5;
                    dmg += 1;
                    max_pierce = 1;
                    break;
                    
                case 3:
                    speed = 3.5;
                    dmg += 2;
                    max_pierce = 1;
                    break;
                    
                case 4:
                    speed = 4; // Faster arrow
                    dmg += 3;
                    max_pierce = 2; // Can pierce 2 enemies
                    break;
                    
                case 5:
                    speed = 4;
                    dmg += 4;
                    max_pierce = 2;
                    break;
                    
                case 6:
                    speed = 4.5;
                    dmg += 5;
                    max_pierce = 2;
                    crit_chance = 0.15; // 15% crit chance
                    break;
                    
                case 7:
                    speed = 5;
                    dmg += 7;
                    max_pierce = 3; // Can pierce 3 enemies
                    crit_chance = 0.2; // 20% crit chance
                    break;
            }
            
            image_angle = direction - 90;
        }
    }
}