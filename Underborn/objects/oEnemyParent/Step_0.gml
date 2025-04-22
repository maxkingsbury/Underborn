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

// === PUSHING AWAY FROM OTHER ENEMIES ===
with (oEnemyParent) {
    if (id != other.id) {
        var dx = x - other.x;
        var dy = y - other.y;
        var dist = point_distance(x, y, other.x, other.y);
        
        // Calculate minimum distance based on both enemies' scales
        var min_distance = 16; // Base distance for small enemies
        
        // Adjust minimum distance when either enemy is larger
        if (scale > 1 || other.scale > 1) {
            min_distance = 16 * max(scale, other.scale);
        }
        
        if (dist < min_distance && dist > 0) {
            // Use standard push strength of 2 for consistent behavior
            var push_strength = 2;
            
            var force = push_strength * (min_distance - dist) / min_distance;
            x += (dx / dist) * force;
            y += (dy / dist) * force;
        }
    }
}

// === DEATH CHECK ===
if (!invincibility && hp <= 0) {
    instance_destroy();  // Destroy enemy if health is 0
}