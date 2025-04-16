/// @description Twinblade

if (instance_exists(oUpgrade)){ exit; }

var twinblade = instance_create_layer(x, y, "Instances", oTwinblade);

twinblade.direction = irandom_range(45, 135);
twinblade.speed = 4;
twinblade.gravity = 0.1;
twinblade.friction = 0.01;

if (oPlayer.twinbladeLevel >= 2) {
	twinblade.scale = 1.5;	
}