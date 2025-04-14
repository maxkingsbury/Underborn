/// @description Slot 2
var time = 60;

switch(slot[1]) {

	case "Slash": 
		event_user(0); 
		time = swordTime;
		break;
	case "Twinblade": 
		event_user(1); 
		time = twinbladeTime;
		break;
	case "Javelin": 
		event_user(2); 
		time = javelinTime;
		break;
	case "Bow":
		event_user(3); 
		time = arrowTime;
		break;
	
}

alarm[1] = time;