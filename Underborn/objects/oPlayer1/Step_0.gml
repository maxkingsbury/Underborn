if (instance_exists(oUpgrade)){ exit; }

// Movement input
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var hor = right - left;
var vertical = down - up;

// Apply movement
x += hor * move_speed;
y += vertical * move_speed;

// Flip sprite based on horizontal direction
if (hor > 0) image_xscale = 1;
if (hor < 0) image_xscale = -1;

// Set sprite based on movement
if (hor != 0 || vertical != 0) {
    sprite_index = spr_PlayerRunning;
} else {
    sprite_index = spr_PlayerIdle;
}