/// @description Javelin

if (instance_exists(oUpgrade)){ exit; }

var nearest_enemy = instance_nearest(x, y, oEnemyParent);

if (nearest_enemy != noone) {

    var direction_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
    var projectile = instance_create_layer(x, y, "Instances", oJavelin);

    with (projectile) {
		direction_to_enemy += irandom_range(-30,30)
        direction = direction_to_enemy;
        speed = 5;
        image_angle = direction - 90; // Rotate the sprite to match movement direction
    }
}