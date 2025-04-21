var _list = ds_list_create();
var _num = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, oEnemyParent, false, true, _list, false);
if (_num > 0) {
    for (var i = 0; i < _num; ++i) {
        var enemy = _list[| i];
        
        // Check if this projectile has already hit this enemy
        var already_hit = false;
        for (var j = 0; j < ds_list_size(enemy.hit_by_projectiles); j++) {
            if (ds_list_find_value(enemy.hit_by_projectiles, j) == projectile_id) {
                already_hit = true;
                break;
            }
        }
        
        // Only hit if NOT invincible, NOT in cooldown, and NOT already hit by THIS projectile
        if (!already_hit && !enemy.invincibility && enemy.invincibility_cooldown <= 0) {
            // Add this projectile's ID to enemy's hit list
            ds_list_add(enemy.hit_by_projectiles, projectile_id);
            
            var dir = point_direction(x, y, enemy.x, enemy.y);
            enemy.x += lengthdir_x(3, dir);
            enemy.y += lengthdir_y(3, dir);
            
            var final_damage = dmg;
            // Check for critical hit
            if (random(1) < global.crit_chance) {
                final_damage *= 2;
                part_particles_create(global.crit_ps, enemy.x, enemy.y, part_crit, 30);
            }
            
            enemy.hp -= final_damage;
            // Set invincibility to prevent immediate hits from other projectiles
            enemy.invincibility = true;
            enemy.invincibility_timer = 10;
            
            // Handle piercing (if this projectile has pierce functionality)
            if (variable_instance_exists(id, "pierce_count")) {
                pierce_count++;
                
                // Check if projectile has hit max enemies
                if (pierce_count >= max_pierce) {
                    instance_destroy();  // Destroy projectile after hitting max enemies
                    break;  // Exit the loop since the projectile is destroyed
                }
            }
        }
    }
}
ds_list_destroy(_list);