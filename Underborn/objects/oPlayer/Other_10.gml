/// @description Sword

if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

var slash = instance_create_layer(x, y, "Instances", oSword);
if (swordLevel >= 2) {
	slash.scale = 2;
}