dmg = 1;

part_crit = part_type_create();
part_type_shape(part_crit, pt_shape_sphere);
part_type_size(part_crit, 0.01, 0.02, 0, 0);
part_type_color1(part_crit, c_yellow);
part_type_alpha1(part_crit, 1);
part_type_speed(part_crit, 0.5, 1, 0, 0);
part_type_direction(part_crit, 0, 360, 0, 0);
part_type_life(part_crit, 5, 15);
part_type_blend(part_crit, true);