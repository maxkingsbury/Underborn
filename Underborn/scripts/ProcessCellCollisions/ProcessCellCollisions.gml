function ProcessCellCollisions(list1, list2) {
    var size1 = ds_list_size(list1);
    var size2 = ds_list_size(list2);
    
    for (var i = 0; i < size1; i++) {
        var enemy1 = ds_list_find_value(list1, i);
        if (!instance_exists(enemy1)) continue;
        
        // If same list, start j from i+1 to avoid duplicate checks
        var start_j = (list1 == list2) ? i + 1 : 0;
        
        for (var j = start_j; j < size2; j++) {
            var enemy2 = ds_list_find_value(list2, j);
            if (!instance_exists(enemy2) || enemy1 == enemy2) continue;
            
            var dx = enemy1.x - enemy2.x;
            var dy = enemy1.y - enemy2.y;
            var dist = point_distance(enemy1.x, enemy1.y, enemy2.x, enemy2.y);
            
            // Standard minimum distance between enemies
            var min_distance = 16;
            
            // Scale adjustment if applicable
            if (variable_instance_exists(enemy1, "scale") && variable_instance_exists(enemy2, "scale")) {
                if (enemy1.scale > 1 || enemy2.scale > 1) {
                    min_distance = 16 * max(enemy1.scale, enemy2.scale);
                }
            }
            
            // Check if enemies are overlapping
            if (dist < min_distance) {
                // Critical overlap detection - when enemies are significantly overlapping
                var critical_overlap = (dist < min_distance * 0.75);
                
                // Use much stronger force for critical overlaps
                var push_strength = critical_overlap ? 8.0 : 4.0;
                
                // Calculate force
                var force;
                if (dist > 0) {
                    force = push_strength * (min_distance - dist) / min_distance;
                    
                    // Apply direct position adjustment - more aggressive
                    enemy1.x += (dx / dist) * force * 0.5;
                    enemy1.y += (dy / dist) * force * 0.5;
                    enemy2.x -= (dx / dist) * force * 0.5;
                    enemy2.y -= (dy / dist) * force * 0.5;
                } else {
                    // Enemies are exactly on top of each other - use random direction
                    var angle = random(360);
                    enemy1.x += lengthdir_x(push_strength, angle);
                    enemy1.y += lengthdir_y(push_strength, angle);
                    enemy2.x -= lengthdir_x(push_strength, angle);
                    enemy2.y -= lengthdir_y(push_strength, angle);
                }
                
                // For critical overlaps, mark them as needing emergency separation
                if (critical_overlap) {
                    enemy1.emergency_separation = true;
                    enemy1.emergency_dir = (dist > 0) ? point_direction(enemy2.x, enemy2.y, enemy1.x, enemy1.y) : random(360);
                    enemy1.emergency_frames = 10;
                    
                    enemy2.emergency_separation = true;
                    enemy2.emergency_dir = (dist > 0) ? point_direction(enemy1.x, enemy1.y, enemy2.x, enemy2.y) : (enemy1.emergency_dir + 180) % 360;
                    enemy2.emergency_frames = 10;
                }
            }
        }
    }
}