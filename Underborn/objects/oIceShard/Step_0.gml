// Inherit the parent event
event_inherited();

var swerve_angle = random(360); // unique start
var swerve_speed = 10 + random(5); // how fast the swerve animates
var swerve_magnitude = 4 + random(2); // how far it swerves left/right
var base_direction = direction; // keep original forward direction

// Update swerve
swerve_angle += swerve_speed;
var offset_angle = base_direction + sin(degtorad(swerve_angle)) * swerve_magnitude;

// Apply motion and rotation
motion_set(offset_angle, speed);
image_angle = offset_angle; // Make sprite face its flying direction

var _list = ds_list_create();
var _num = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, oEnemyParent, false, true, _list, false);

if (_num > 0) {
	instance_destroy();
}

ds_list_destroy(_list);

if (part_system_exists(ps_ice)) {
    part_particles_create(ps_ice, x, y, pt_ice_trail, 1);
}