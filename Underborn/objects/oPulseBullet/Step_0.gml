x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

image_xscale = 0.75;
image_yscale = 0.75;

part_particles_create(global.ptc_sys, x, y, global.ptc_bulletTrail, 1);