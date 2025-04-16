/// @description Arrow

if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

var nearest_enemy = instance_nearest(x, y, oEnemyParent);

if (nearest_enemy != noone) {

    var direction_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
    var projectile = instance_create_layer(x, y, "Instances", oArrow);

    with (projectile) {
		direction_to_enemy += irandom_range(-5,5)
        direction = direction_to_enemy;
        speed = 3;
        image_angle = direction - 90;
    }
}