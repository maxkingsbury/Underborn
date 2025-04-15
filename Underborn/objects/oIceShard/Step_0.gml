// Inherit the parent event
event_inherited();

var _list = ds_list_create();
var _num = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, oEnemyParent, false, true, _list, false);

if (_num > 0) {
	instance_destroy();
}

ds_list_destroy(_list);

if (part_system_exists(ps_ice)) {
    part_particles_create(ps_ice, x, y, pt_ice_trail, 1);
}