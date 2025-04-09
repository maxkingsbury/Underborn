// Wait until Enter is pressed to move on
if (tutorial_stage == 0 && keyboard_check_pressed(vk_enter)) {
    tutorial_stage++;
}

if (tutorial_stage == 1 && keyboard_check_pressed(vk_enter)) {
    tutorial_stage++;
}

if (tutorial_stage == 2 && keyboard_check_pressed(vk_enter)) {
    tutorial_stage++;
}

// When tutorial is over, you can go to the game room
if (tutorial_stage == 3 && keyboard_check_pressed(vk_enter)) {
	audio_play_sound(sndConfirm, 0.5, false);
    room_goto(introRoom); // Change this to your next room
}
