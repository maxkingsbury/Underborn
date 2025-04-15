/// @description Ice Shard
if (instance_exists(oUpgrade)){ exit; }

var nearest_enemy = instance_nearest(x, y, oEnemyParent);

if (nearest_enemy != noone) {

    var direction_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
    var projectile = instance_create_layer(x, y, "Instances", oIceShard);

    with (projectile) {
		direction_to_enemy += irandom_range(-15,15)
        direction = direction_to_enemy;
        speed = 2;
        image_angle = direction;
    }
}