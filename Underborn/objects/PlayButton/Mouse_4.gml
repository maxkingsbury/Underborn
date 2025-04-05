if (global.firstPlay == true){ 
	global.firstPlay = false;
	room_goto(introRoom);
} else {
room_goto(gameRoom);
}