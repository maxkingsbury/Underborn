/// @description Slot 4
var time = 60;

switch(slot[3]) {

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

alarm[3] = time;