var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var hor = right - left;
var vertical = down - up;

x += hor * move_speed;
y += vertical * move_speed;

if (hor > 0) { image_xscale = 1 }
if (hor < 0) { image_xscale = -1 }