var is_hovered = point_in_rectangle(
    mouse_x, mouse_y,
    x - 100, y - 40,   // adjust width/height as needed for your button
    x + 100, y + 40
);

hovered = is_hovered; // store the hover state

if (is_hovered && !was_hovered) {
    audio_play_sound(sndMove, 1, false);
}

was_hovered = is_hovered;

if (save_msg_timer > 0) {
    save_msg_timer -= 1;
}