/// @description Fireball

if (instance_exists(oUpgrade)){ exit; }

var angle = random(360); // Random direction in degrees

    var px = x + lengthdir_x(10, angle); // spawn a bit away from player
    var py = y + lengthdir_y(10, angle);

    var bullet = instance_create_layer(px, py, "Instances", oFireball);
    bullet.direction = angle;
    bullet.speed = 1;