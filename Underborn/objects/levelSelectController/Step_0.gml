if (keyboard_check_pressed(vk_up)) {
    menu_index = max(menu_index - 1, 0);
	
	if (menu_stage == 0 || menu_stage == 1){
		audio_play_sound(sndMove, 0.5, 0);
	}
}

if (keyboard_check_pressed(vk_down)) {
    if (menu_stage == 0){
        menu_index = min(menu_index + 1, array_length(character_options) - 1);
		audio_play_sound(sndMove, 0.5, 0);
	}
    else if (menu_stage == 1) {
        menu_index = min(menu_index + 1, array_length(level_options) - 1);
		audio_play_sound(sndMove, 0.5, 0);
	}
}

if (keyboard_check_pressed(vk_enter)) {
    if (menu_stage == 0) {
		audio_play_sound(sndConfirm, 0.5, false);
        character_selected = true;
        global.selected_character = character_options[menu_index];
        menu_index = 0;
        menu_stage = 1;
    } else if (menu_stage == 1) {
		audio_play_sound(sndConfirm, 0.5, false);
        level_selected = true;
        global.selected_level = level_options[menu_index];
        menu_stage = 2;
    } else if (menu_stage == 2) {
		audio_play_sound(sndConfirm, 0.5, false);
        // Start the game
        room_goto(gameRoom);
    }
}
