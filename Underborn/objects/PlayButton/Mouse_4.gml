audio_play_sound(sndConfirm, 0.5, false);

if (global.firstPlay == true){ 
	global.firstPlay = false;
	room_goto(tutorialRoom);
} else {
	room_goto(levelSelectRoom);
}