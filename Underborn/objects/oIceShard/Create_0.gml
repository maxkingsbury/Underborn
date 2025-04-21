// Inherit the parent event
event_inherited();

dmg = global.weapon_data[? "Ice Shard"].damage;

image_xscale = 0.5;
image_yscale = 0.5;

ps_ice = part_system_create();
part_system_depth(ps_ice, depth + 1);

pt_ice_trail = part_type_create();
part_type_shape(pt_ice_trail, pt_shape_flare);
part_type_size(pt_ice_trail, 0.01, 0.04, 0, 0);
part_type_color1(pt_ice_trail, make_color_rgb(150, 220, 255));
part_type_alpha3(pt_ice_trail, 0.6, 0.3, 0);
part_type_life(pt_ice_trail, 10, 20);
part_type_speed(pt_ice_trail, 0.05, 0.2, 0, 0);
part_type_direction(pt_ice_trail, 0, 360, 0, 0);
part_type_blend(pt_ice_trail, true);