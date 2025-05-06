/// @description Arrow
randomize();
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

if (arrowLevel > 7) {
	arrowLevel = 7;
}

var nearest_enemy = instance_nearest(x, y, oEnemyParent);
var total_arc_degrees = 0;
if (nearest_enemy != noone) {
    var direction_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
    
    // Determine number of arrows based on level
	var arrow_count = 1;


	// Set arc width based on arrow count - using same values as your ice shard
	if (arrow_count == 1) {
	    total_arc_degrees = 0;
	}


	// Create arrows using your exact ice shard distribution method
	for (var a = 0; a < arrow_count; a++) {
	    // Using your exact lerp approach that works for ice shards
	    var t = arrow_count == 1 ? 0.5 : a / (arrow_count - 1);
	    var angle_offset = lerp(-total_arc_degrees / 2, total_arc_degrees / 2, t);
	    var random_jitter = 0; // Set to 0 as requested, or use small value if desired
	    var final_direction = direction_to_enemy + angle_offset + random_jitter;
    
	    var projectile = instance_create_layer(x, y, "Instances", oArrow);
	    projectile.direction = final_direction;
    
	    with (projectile) {
	        // CRUCIAL: Set the image_angle correctly
	        image_angle = direction - 90;
        
	        // Initialize pierce variables correctly
	        pierce_count = 0;
            
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
                    max_pierce = 2;
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