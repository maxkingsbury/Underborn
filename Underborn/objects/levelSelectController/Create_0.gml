character_selected = false;
level_selected = false;

// Placeholder names
character_name = "The Gracebound";
level_name = "The Hollow Gate";

// For future expansion
character_options = [
	{	sName: "Gribnuk", 
		desc: "A sneaky goblin rogue with a love for \n shiny things and a silver tongue. \nSmall in size, big on mischief. \nGribnuk talks fast, moves faster,\n and always has a trick up his sleeve\n (and probably a stolen coin or two)",
		stats: "Damage: 1 \n Speed: 3 \n Crit Chance: 0% \n Crit Damage: 100% \n",
		
		anim_idle: spr_PlayerIdle,
		anim_walk: spr_PlayerRunning,
		
		start_weapon: "Bow",
		pDamage: 1,
		pSpeed: 3,
		//crit_chance: 0,
		//crit_multiplier: 1.0,
	},
	{	sName: "The Other Character", 
		desc: "test",
		stats: "Damage: 1 \n Speed: 2 \n Crit Chance: +25% \n Crit Damage: +150% \n",
		
		anim_idle: spr_PlayerIdle,
		anim_walk: spr_PlayerRunning,
		
		start_weapon: "Slash",
		pDamage: 1,
		pSpeed: 2,
		//crit_chance: 0.25,
		//crit_multiplier: 1.5,
	}
	];
level_options = [
	{	sName: "Green Outlands", 
		desc: "A calm, sunlit region of hills and meadows\n a gentle start for any adventurer.",
		stats: "Spawn Rate: +25% \n XP Rate: +50% \n Enemy Speed: +0% \n Coin Drop +100%"
	}
	];

// Cursor
menu_index = 0;
menu_stage = 0; // 0 = pick character, 1 = pick level, 2 = start game
