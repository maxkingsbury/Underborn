// Move fireflies
for (var i = 0; i < firefly_count; i++) {
    fireflies[i].x += lengthdir_x(fireflies[i].speed, fireflies[i].angle);
    fireflies[i].y += lengthdir_y(fireflies[i].speed, fireflies[i].angle);

    // Wrap around screen
    if (fireflies[i].x < 0) fireflies[i].x = display_get_width();
    if (fireflies[i].x > display_get_width()) fireflies[i].x = 0;
    if (fireflies[i].y < 0) fireflies[i].y = display_get_height();
    if (fireflies[i].y > display_get_height()) fireflies[i].y = 0;
}