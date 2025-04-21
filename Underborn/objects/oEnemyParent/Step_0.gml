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
        if (dist < 16 && dist > 0) {
			var push_strength = 2
			if (scale > 1) {
				push_strength = 5;
			} 
            var force = push_strength * (16 - dist) / 16;
            x += (dx / dist) * force;
            y += (dy / dist) * force;
        }
    }
}

// === DEATH CHECK ===
if (!invincibility && hp <= 0) {
    instance_destroy();  // Destroy enemy if health is 0
}