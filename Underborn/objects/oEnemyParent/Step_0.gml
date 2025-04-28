// Initialize variables if they don't exist
if (!variable_instance_exists(id, "push_vx")) {
    push_vx = 0;
}
if (!variable_instance_exists(id, "push_vy")) {
    push_vy = 0;
}
if (!variable_instance_exists(id, "emergency_separation")) {
    emergency_separation = false;
    emergency_dir = 0;
    emergency_frames = 0;
}

// Handle emergency separation (high priority, ignores all other movement)
if (emergency_separation) {
    // Strong forced movement in emergency direction
    var emergency_speed = 2.5;
    x += lengthdir_x(emergency_speed, emergency_dir);
    y += lengthdir_y(emergency_speed, emergency_dir); // Fixed this line, was using emergency_dir twice
    
    // Countdown emergency frames
    emergency_frames--;
    if (emergency_frames <= 0) {
        emergency_separation = false;
    }
}

// Apply push velocity and decay it
if (push_vx != 0 || push_vy != 0) {
    x += push_vx;
    y += push_vy;
    
    // Decay push velocity
    push_vx *= 0.8;
    push_vy *= 0.8;
    
    // Reset very small values to zero
    if (abs(push_vx) < 0.1) push_vx = 0;
    if (abs(push_vy) < 0.1) push_vy = 0;
}

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
// This section is now run by a controller

// === DEATH CHECK ===
if (!invincibility && hp <= 0) {
    instance_destroy();  // Destroy enemy if health is 0
}