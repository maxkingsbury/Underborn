if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

if (just_spawned) {
    unstick_frames -= 1;

    // Force simple local unstick using nearby enemies (fast)
    var nearby_list = ds_list_create();
    collision_circle_list(x, y, 24, oEnemyParent, false, true, nearby_list, false);
    
    for (var i = 0; i < ds_list_size(nearby_list); i++) {
        var other_enemy = nearby_list[| i];
        if (other_enemy == id) continue;
        
        var dx = x - other_enemy.x;
        var dy = y - other_enemy.y;
        var dist2 = dx * dx + dy * dy;
        var min_dist = 16 * max(scale, other_enemy.scale);
        var min_dist2 = min_dist * min_dist;
        
        if (dist2 < min_dist2 && dist2 > 0) {
            var dist = sqrt(dist2);
            var push = (min_dist - dist);
            
            dx /= dist;
            dy /= dist;
            
            x += dx * push * 0.5;
            y += dy * push * 0.5;
            other_enemy.x -= dx * push * 0.5;
            other_enemy.y -= dy * push * 0.5;
        }
    }
    
    ds_list_destroy(nearby_list);

    // Finish unsticking after a few frames
    if (unstick_frames <= 0) {
        just_spawned = false;
    }
}

// === COLLISION RESOLUTION WITH OTHER ENEMIES ===
var push_strength = 0.2; // Small push per frame
var min_distance = 16;   // Minimum distance between enemies

var nearby_list = ds_list_create();
collision_circle_list(x, y, min_distance * 1.5, oEnemyParent, false, true, nearby_list, false);

for (var i = 0; i < ds_list_size(nearby_list); i++) {
    var other_enemy = nearby_list[| i];
    if (other_enemy == id) continue;

    var dx = x - other_enemy.x;
    var dy = y - other_enemy.y;
    var dist2 = dx * dx + dy * dy;
    if (dist2 == 0) dist2 = 0.01; // Avoid division by zero

    var dist = sqrt(dist2);

    if (dist < min_distance) {
        var overlap = (min_distance - dist) / 2; // Each enemy moves half
        var nx = dx / dist;
        var ny = dy / dist;

        x += nx * overlap * push_strength;
        y += ny * overlap * push_strength;
        other_enemy.x -= nx * overlap * push_strength;
        other_enemy.y -= ny * overlap * push_strength;
    }
}

ds_list_destroy(nearby_list);

// === INVINCIBILITY TIMER ===
if (invincibility) {
    sprite_index = sprW;  // Stay white while invincible
    invincibility_timer -= 1;
    if (invincibility_timer <= 0) {
        invincibility = false;
        invincibility_cooldown = 2;  // Cooldown to prevent instant re-hit
        sprite_index = spr;  // Go back to normal color
    }
} else {
    // If cooldown is active, decrement it
    if (invincibility_cooldown > 0) {
        invincibility_cooldown -= 1;
    }
}

// === DEATH CHECK ===
if (!invincibility && hp <= 0) {
    instance_destroy();  // Destroy enemy if health is 0
}
