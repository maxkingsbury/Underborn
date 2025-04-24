// Move upward
y += vertical_speed;

// Slow down the upward movement
vertical_speed *= 0.95;

// Start fading after some time
life_timer -= 1;
if (life_timer <= 15) {
    alpha = life_timer / 15;
}

// Destroy when completely faded
if (life_timer <= 0) {
    instance_destroy();
}