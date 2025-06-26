x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

image_xscale = 3;
image_yscale = 3;

part_particles_create(global.ptc_sys, x, y, global.ptc_waveTrail, 1);