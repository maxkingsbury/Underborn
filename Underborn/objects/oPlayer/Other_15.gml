/// @description Fireball
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

// Determine how many fireballs to create based on level
var fireball_count = 1;
if (fireballLevel >= 5) fireball_count = 3;
else if (fireballLevel >= 3) fireball_count = 2;

for (var f = 0; f < fireball_count; f++) {
    var angle = random(360); // Random direction in degrees
    var spawn_distance = 10;
    
    // Level 6+ creates fireballs in a protective orbit pattern
    if (fireballLevel >= 6) {
        angle = (360 / fireball_count) * f + (current_time / 50) % 360; // Orbital pattern
        spawn_distance = 30; // Further from player
    }
    
    var px = x + lengthdir_x(spawn_distance, angle);
    var py = y + lengthdir_y(spawn_distance, angle);
    
    var bullet = instance_create_layer(px, py, "Instances", oFireball);
    with (bullet) {
        direction = angle;
        
        // Level-based improvements
        switch (other.fireballLevel) {
            case 1:
                // Base fireball
                speed = 1;
                max_pierce = 1;
                explosion_radius = 20; // Small explosion radius
                break;
                
            case 2:
                speed = 1.2;
                dmg += 2;
                max_pierce = 1;
                explosion_radius = 25;
                break;
                
            case 3:
                speed = 1.2;
                dmg += 3;
                max_pierce = 1;
                explosion_radius = 30;
                scale = 1.2; // Larger fireball
                break;
                
            case 4:
                speed = 1.5;
                dmg += 4;
                max_pierce = 2; // Can hit 2 enemies before exploding
                explosion_radius = 35;
                scale = 1.3;
                break;
                
            case 5:
                speed = 1.5;
                dmg += 5;
                max_pierce = 2;
                explosion_radius = 40;
                scale = 1.4;
                burn_effect = true; // Add burning damage over time
                burn_damage = 1;
                burn_duration = 120; // 2 seconds at 60fps
                break;
                
            case 6:
                // Orbital fireballs at level 6
                if (other.fireballLevel == 6) {
                    speed = 0; // No speed for orbital fireballs
                    orbit_player = true;
                    orbit_radius = 30;
                    orbit_speed = 2;
                } else {
                    speed = 1.8;
                }
                dmg += 6;
                max_pierce = 2;
                explosion_radius = 45;
                scale = 1.5;
                burn_effect = true;
                burn_damage = 2;
                burn_duration = 180; // 3 seconds
                break;
                
            case 7:
                // Enhanced orbital fireballs or fast projectiles
                if (other.fireballLevel == 7 && f < 3) { // First 3 are orbital
                    speed = 0;
                    orbit_player = true;
                    orbit_radius = 40;
                    orbit_speed = 3;
                } else {
                    speed = 2; // Additional projectiles are fast
                    homing = true; // Add homing capability
                    homing_strength = 0.05;
                }
                dmg += 8;
                max_pierce = 3;
                explosion_radius = 50;
                scale = 1.6;
                burn_effect = true;
                burn_damage = 3;
                burn_duration = 240; // 4 seconds
                break;
        }
    }
    
    // At level 7, add additional projectiles that seek enemies
    if (fireballLevel == 7 && f < 3) { // After creating the 3 orbital fireballs
        var nearest_enemy = instance_nearest(x, y, oEnemyParent);
        if (nearest_enemy != noone) {
            // Create 2 additional homing fireballs
            for (var h = 0; h < 2; h++) {
                var direction_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
                direction_to_enemy += random_range(-30, 30); // Some spread
                
                var homing_fireball = instance_create_layer(x, y, "Instances", oFireball);
                with (homing_fireball) {
                    direction = direction_to_enemy;
                    speed = 2;
                    dmg += 8;
                    max_pierce = 3;
                    explosion_radius = 50;
                    scale = 1.6;
                    burn_effect = true;
                    burn_damage = 3;
                    burn_duration = 240;
                    homing = true;
                    homing_strength = 0.05;
                }
            }
        }
    }
}