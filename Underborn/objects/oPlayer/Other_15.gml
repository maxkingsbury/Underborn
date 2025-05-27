/// @description Fireball
if (instance_exists(oUpgrade) || global.isPaused) exit;
if (instance_number(oFireball) >= 2) exit;

if (fireballLevel > 7) fireballLevel = 7;

// How many fireballs to spawn
var fireball_count = 1;
if (fireballLevel >= 5) fireball_count = 3;
else if (fireballLevel >= 3) fireball_count = 2;

// Loop to spawn each fireball
for (var f = 0; f < fireball_count; f++) {
    var angle = random(360);
    var spawn_distance = 10;

    // Orbiting fireballs start at level 6
    if (fireballLevel >= 6) {
        angle = (360 / fireball_count) * f + (current_time / 50) % 360;
        spawn_distance = 30;
    }

    var px = x + lengthdir_x(spawn_distance, angle);
    var py = y + lengthdir_y(spawn_distance, angle);

    var bullet = instance_create_layer(px, py, "Instances", oFireball);
    
    with (bullet) {
        direction = angle;
		pierce_count = 0;
        switch (other.fireballLevel) {
            case 1:
                speed = 1;
                dmg = 5;
                max_pierce = 1;
                explosion_radius = 20;
                break;
            case 2:
                speed = 1.2;
                dmg = 7;
                max_pierce = 1;
                explosion_radius = 25;
                break;
            case 3:
                speed = 1.2;
                dmg = 8;
                max_pierce = 1;
                explosion_radius = 30;
                scale = 1.2;
                break;
            case 4:
                speed = 1.5;
                dmg = 9;
                max_pierce = 2;
                explosion_radius = 35;
                scale = 1.3;
                break;
            case 5:
                speed = 1.5;
                dmg = 10;
                max_pierce = 2;
                explosion_radius = 40;
                scale = 1.4;
                burn_effect = true;
                burn_damage = 1;
                burn_duration = 120;
                break;
            case 6:
                if (f < 3) {
                    speed = 0;
                    orbit_player = true;
                    orbit_radius = 30;
                    orbit_speed = 2;
                } else {
                    speed = 1.8;
                }
                dmg = 12;
                max_pierce = 2;
                explosion_radius = 45;
                scale = 1.5;
                burn_effect = true;
                burn_damage = 2;
                burn_duration = 180;
                break;
            case 7:
                if (f < 3) {
                    speed = 0;
                    orbit_player = true;
                    orbit_radius = 40;
                    orbit_speed = 3;
                } else {
                    speed = 2;
                    homing = true;
                    homing_strength = 0.05;
                }
                dmg = 13;
                max_pierce = 3;
                explosion_radius = 50;
                scale = 1.6;
                burn_effect = true;
                burn_damage = 3;
                burn_duration = 240;
                break;
        }
    }

    // Extra homing fireballs at level 7
    if (fireballLevel == 7 && f < 3) {
        var target = instance_nearest(x, y, oEnemyParent);
        if (target != noone) {
            for (var h = 0; h < 2; h++) {
                var dir = point_direction(x, y, target.x, target.y) + random_range(-30, 30);
                var h_fireball = instance_create_layer(x, y, "Instances", oFireball);
                with (h_fireball) {
                    direction = dir;
                    speed = 2;
                    dmg = 13;
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
