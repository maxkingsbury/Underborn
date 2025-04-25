
/// @description Enemy spawner


alarm[2] = alarmSpawnTime;

if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

var actual_time = current_time;
if (is_paused) {
    actual_time = pause_start_time;
}
var elapsed = actual_time - room_start_time - pause_offset;
var total_seconds = floor(elapsed / 1000);
var minutes = floor(total_seconds / 60);

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
instance_activate_region(_vx - 100, _vy - 100, _vw + 200, _vh + 200, true);
instance_deactivate_region(
    _vx - 200,    // Left: 200px before the viewport's X position
    _vy - 200,    // Top: 200px before the viewport's Y position
    _vw + 400,    // Width: Viewport + 200px on the right side
    _vh + 450,    // Height: Viewport + 200px on the bottom
    false,        // false means deactivate outside the region
    true          // true means include all objects (not excluding any)
);
instance_activate_object(oThumbstick);

if (instance_exists(oBoss1)) {
    var dist = point_distance(oBoss1.x, oBoss1.y, oPlayer.x, oPlayer.y);
    
    // If boss is too far away (e.g., off-screen)
    if (dist > 300) {
        // Teleport boss randomly near player
        var angle = random(360);
        var radius = 250; 

        oBoss1.x = oPlayer.x + lengthdir_x(radius, angle);
        oBoss1.y = oPlayer.y + lengthdir_y(radius, angle);
    }
}

// Boss spawning
if (!boss1_spawned && minutes >= 1) {
    var boss_x = oPlayer.x + lengthdir_x(200, irandom_range(0, 360));
    var boss_y = oPlayer.y + lengthdir_y(200, irandom_range(0, 360));

    instance_create_layer(boss_x, boss_y, "Instances", oBoss1); 
	if (instance_exists(oBoss1)) {
		boss1_spawned = true; // Prevents re-spawning
	} 
}



if (instance_number(oEnemyParent) < 200){
	var spawn_radius = 220;
	var buffer = 100; // Must match your activation buffer
	
	if (minutes <= 1){
		repeat(2) {
		    var valid_spawn = false;
		    var XX, YY;

		    while (!valid_spawn) {
		        var dir = irandom_range(0, 360);
		        XX = oPlayer.x + lengthdir_x(spawn_radius, dir);
		        YY = oPlayer.y + lengthdir_y(spawn_radius, dir);

		        // Check if it's inside the active region
		        if (XX > _vx - buffer && XX < _vx + _vw + buffer &&
		            YY > _vy - buffer && YY < _vy + _vh + buffer) {
		            valid_spawn = true;
		        }
		    }
		
			var percent = random(1); // Generates a random number between 0 and 1

			if (percent < 0.9) {
				instance_create_layer(XX, YY, "Instances", oEnemyBat);
			} else {
			    instance_create_layer(XX, YY, "Instances", oEnemySlime);
			}
		}
	}
	if (minutes > 1 && minutes <= 2) {
		repeat(2) {
			var valid_spawn = false;
			var XX, YY;

			while (!valid_spawn) {
			    var dir = irandom_range(0, 360);
			    XX = oPlayer.x + lengthdir_x(spawn_radius, dir);
			    YY = oPlayer.y + lengthdir_y(spawn_radius, dir);

			    // Check if it's inside the active region
			    if (XX > _vx - buffer && XX < _vx + _vw + buffer &&
			        YY > _vy - buffer && YY < _vy + _vh + buffer) {
			        valid_spawn = true;
			    }
			}
		
			var percent = random(1); // Generates a random number between 0 and 1

			if (percent < 0.4) {
				instance_create_layer(XX, YY, "Instances", oEnemyBat);
			} else {
				instance_create_layer(XX, YY, "Instances", oEnemySlime);
			}
		}
	}
	if (minutes > 3 && minutes <= 5) {
		repeat(4) {
			var valid_spawn = false;
			var XX, YY;

			while (!valid_spawn) {
			    var dir = irandom_range(0, 360);
			    XX = oPlayer.x + lengthdir_x(spawn_radius, dir);
			    YY = oPlayer.y + lengthdir_y(spawn_radius, dir);
			    if (XX > _vx - buffer && XX < _vx + _vw + buffer &&
			        YY > _vy - buffer && YY < _vy + _vh + buffer) {
			        valid_spawn = true;
			    }
			}
			instance_create_layer(XX, YY, "Instances", oEnemyBat);
		}
	}
}

