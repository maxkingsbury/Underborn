var cam = view_camera[0];

if (global.shake_timer > 0) {
    global.shake_timer--;

    var shake_x = random_range(-global.shake_strength, global.shake_strength);
    var shake_y = random_range(-global.shake_strength, global.shake_strength);

    camera_set_view_pos(cam, shake_x, shake_y);
} else {
    camera_set_view_pos(cam, 0, 0);
}