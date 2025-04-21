// Inherit the parent event
event_inherited();

dmg = global.weapon_data[? "Fireball"].damage;
crit_chance = global.weapon_data[? "Fireball"].crit_chance + global.crit_chance;

image_xscale = 2;
image_yscale = 2;

part_sys = part_system_create();

part_fire = part_type_create();
part_type_shape(part_fire, pt_shape_explosion);
part_type_size(part_fire, 0.02, 0.06, 0, 0);
part_type_color3(part_fire, c_yellow, c_orange, c_red);
part_type_alpha2(part_fire, 1, 0);
part_type_speed(part_fire, 0.25, 1, 0, 0);
part_type_direction(part_fire, 0, 360, 0, 0);
part_type_life(part_fire, 25, 40);