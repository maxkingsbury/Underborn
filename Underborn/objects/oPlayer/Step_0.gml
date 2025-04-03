// Player movement speed
var move_speed = 2;

// Get input
var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Apply movement
x += move_x * move_speed;
y += move_y * move_speed;

// Change sprite based on movement
if (move_x != 0 || move_y != 0) {
    sprite_index = spr_PlayerRunning; // Running animation
    image_speed = 1; // Ensure animation plays
} else {
    sprite_index = spr_PlayerIdle; // Idle animation
    image_index = 0; // Reset to first frame
    image_speed = 0; // Stop animation
}

// Flip sprite based on direction
if (move_x > 0) image_xscale = 1;  // Facing right
if (move_x < 0) image_xscale = -1; // Facing left
