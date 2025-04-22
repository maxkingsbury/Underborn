/// @description Ice Shard
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

var nearest_enemy = instance_nearest(x, y, oEnemyParent);
var total_arc_degrees = 0;
if (nearest_enemy != noone) {
    var direction_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
    
    // Determine how many shards to create based on level
    var shard_count = 1;
    if (iceShardLevel >= 6) shard_count = 4;
    else if (iceShardLevel >= 4) shard_count = 3;
    else if (iceShardLevel >= 2) shard_count = 2;
    
	if (shard_count == 1) {
		total_arc_degrees = 0;
	}
	else if (shard_count == 2) { 
		total_arc_degrees = 15;
	} 
	else if (shard_count == 3) {
		total_arc_degrees = 30;
	}
	else {
		total_arc_degrees = 45;
	}
	
	
    for (var i = 0; i < shard_count; i++) {
		
        var t = shard_count == 1 ? 0.5 : i / (shard_count - 1);
	    var angle_offset = lerp(-total_arc_degrees / 2, total_arc_degrees / 2, t);
	    var random_jitter = irandom_range(-5, 5); // optional randomness
	    var final_direction = direction_to_enemy + angle_offset + random_jitter;

	    var projectile = instance_create_layer(x, y, "Instances", oIceShard);
	    projectile.direction = final_direction;
		
        with (projectile) {
            // Level-based improvements
            switch (other.iceShardLevel) {
                case 1:
                    // Base ice shard
                    speed = 2;
                    max_pierce = 1;
                    slow_effect = 0.2; // 20% slow effect
                    slow_duration = 60; // 1 second at 60fps
                    break;
                    
                case 2:
                    speed = 2;
                    dmg += 1;
                    max_pierce = 1;
                    slow_effect = 0.3; // 30% slow
                    slow_duration = 90; // 1.5 seconds
                    break;
                    
                case 3:
                    speed = 2.2;
                    dmg += 2;
                    max_pierce = 1;
                    slow_effect = 0.3;
                    slow_duration = 120; // 2 seconds
                    break;
                    
                case 4:
                    speed = 2.2;
                    dmg += 3;
                    max_pierce = 2; // Can pierce 2 enemies
                    slow_effect = 0.4; // 40% slow
                    slow_duration = 120;
                    break;
                    
                case 5:
                    speed = 2.5;
                    dmg += 4;
                    max_pierce = 2;
                    slow_effect = 0.5; // 50% slow
                    slow_duration = 150; // 2.5 seconds
                    scale = 1.2; // Larger ice shard
                    break;
                    
                case 6:
                    speed = 2.5;
                    dmg += 5;
                    max_pierce = 2;
                    slow_effect = 0.6; // 60% slow
                    slow_duration = 180; // 3 seconds
                    scale = 1.3;
                    freeze_chance = 0.1; // 10% chance to freeze enemy completely
                    break;
                    
                case 7:
                    speed = 3;
                    dmg += 6;
                    max_pierce = 3; // Can pierce 3 enemies
                    slow_effect = 0.7; // 70% slow
                    slow_duration = 210; // 3.5 seconds
                    scale = 1.5;
                    freeze_chance = 0.2; // 20% chance to freeze
                    aoe_radius = 40; // Small AoE effect on impact
                    break;
            }
            
            image_angle = direction;
        }
    }
}