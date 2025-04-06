

var twinblade = instance_create_layer(x, y, "Instances", oTwinblade);

twinblade.direction = irandom_range(45, 135);
twinblade.speed = 4;
twinblade.gravity = 0.1;
twinblade.friction = 0.01;