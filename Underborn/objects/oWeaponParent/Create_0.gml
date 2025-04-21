dmg = 1;
projectile_id = irandom(1000000);  // Generate a unique ID for this projectile

// Default behavior is to break on first impact (pierce_count = 1)
pierce_count = 0;
max_pierce = 1;  // Default to breaking on first hit

part_crit = part_type_create();
part_type_shape(part_crit, pt_shape_sphere);
part_type_size(part_crit, 0.01, 0.02, 0, 0);
part_type_color1(part_crit, c_yellow);
part_type_alpha1(part_crit, 1);
part_type_speed(part_crit, 0.5, 1, 0, 0);
part_type_direction(part_crit, 0, 360, 0, 0);
part_type_life(part_crit, 5, 15);
part_type_blend(part_crit, true);