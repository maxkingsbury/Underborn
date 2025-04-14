if (instance_exists(oUpgrade)) {
    draw_sprite(global.cached_sprite, global.cached_image_index, x, y);
} else {
    draw_self();
}