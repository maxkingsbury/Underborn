/// @description Sword

if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }

var slash = instance_create_layer(x, y, "Instances", oSword);

// Apply upgrade based on swordLevel
switch (swordLevel) {
	case 1:
		// Base sword slash
		break;
		
	case 2:
		slash.scale = 2;
		break;

	case 3:
		slash.scale = 2;
		slash.damage += 1; // slightly higher damage
		break;

	case 4:
		slash.scale = 2.5;
		slash.damage += 2;
		break;

	case 5:
		slash.scale = 2.5;
		slash.damage += 2;
		slash.pierce = 1; // can hit 2 enemies instead of just 1
		break;

	case 6:
		slash.scale = 3;
		slash.damage += 3;
		slash.pierce = 2; // hits 3 enemies now
		break;

	case 7:
		slash.scale = 3;
		slash.damage += 3;
		slash.pierce = 2;
		slash.crit_chance = 0.25; // 25% chance to crit
		slash.crit_multiplier = 2.0;
		break;
}
