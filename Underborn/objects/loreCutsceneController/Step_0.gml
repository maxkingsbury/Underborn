if (current_line < array_length(lore_lines)) {
    var full_line = lore_lines[current_line];

    // Typing effect
    if (!finished_line) {
        if (char_timer++ >= text_speed) {
            char_timer = 0;
            if (string_length(displayed_text) < string_length(full_line)) {
                displayed_text = string_copy(full_line, 1, string_length(displayed_text) + 1);
            } else {
                finished_line = true;
            }
        }
    } else {
        // Wait for player input to go to next line
        if (input_cooldown > 0) input_cooldown--;
		if (input_cooldown <= 0 && keyboard_check_pressed(ord("P"))) {
			room_goto(levelSelectRoom);
		}
        if (input_cooldown <= 0 && keyboard_check_pressed(vk_space)) {
            current_line++;
            displayed_text = "";
            finished_line = false;
            input_cooldown = 10;
        }
    }
} else {
    // All lines shown, transition to next room
    room_goto(levelSelectRoom);
}

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