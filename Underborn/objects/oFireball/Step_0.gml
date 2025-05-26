// Inherit the parent event
event_inherited();

if (orbit_player) {
    orbit_angle += orbit_speed; // degrees per frame
    x = oPlayer.x + lengthdir_x(orbit_radius, orbit_angle);
    y = oPlayer.y + lengthdir_y(orbit_radius, orbit_angle);
}

if (homing) {
    var target = instance_nearest(x, y, oEnemyParent);
    if (target != noone) {
        var angle_to_target = point_direction(x, y, target.x, target.y);
        direction = lerp(direction, angle_to_target, homing_strength);
        speed = max(speed, 2); // optional, keep it moving
    }
}
