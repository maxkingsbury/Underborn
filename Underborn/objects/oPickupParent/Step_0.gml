if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

if (canFly) {
    // Accelerate up to max speed
    fly_speed = clamp(fly_speed + fly_accel, -1, fly_max_speed);

    // Always recalculate direction straight to player
    var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
    
    // Move in that direction at current speed
    x += lengthdir_x(fly_speed, dir);
    y += lengthdir_y(fly_speed, dir);
}