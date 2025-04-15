/// @description Slot 6
var time = 60;

switch(slot[5]) {

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
	case "Ice Shard":
		event_user(4); 
		time = iceShardTime;
		break;
	case "Fireball":
		event_user(5); 
		time = fireballTime;
		break;
	
}

alarm[5] = time;