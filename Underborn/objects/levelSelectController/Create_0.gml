character_selected = false;
level_selected = false;

// Placeholder names
character_name = "The Gracebound";
level_name = "The Hollow Gate";

character_options = [
	{
		sName: "Gribnuk", 
		desc: "A sneaky goblin rogue with a love for \nshiny things and a silver tongue. \nSmall in size, big on mischief. \nGribnuk talks fast, moves faster,\nand always has a trick up his sleeve\n(and probably a stolen coin or two).",
		stats: "Damage: 1 \nSpeed: 2 \nCrit Chance: 0% \nCrit Damage: 100%",
		
		anim_idle: spr_PlayerIdle,
		anim_walk: spr_PlayerRunning,
		
		start_weapon: "Javelin",
		pDamage: 1,
		pSpeed: 2,
	},

	{
		sName: "Kaela Stormheart", 
		desc: "A fierce warrior from the northern highlands. \nKaela fights with honor and unmatched strength. \nShe doesn't say much - her sword does the talking.",
		stats: "Damage: 3 \nSpeed: 1 \nCrit Chance: 10% \nCrit Damage: 125%",
		
		anim_idle: spr_PlayerIdle,
		anim_walk: spr_PlayerRunning,
		
		start_weapon: "Sword",
		pDamage: 3,
		pSpeed: 1,
	},

	{
		sName: "Professor Zogg", 
		desc: "A quirky alchemist with unstable potions. \nZogg uses science to solve problems. \nDon't ask about the lab incident.",
		stats: "Damage: 2 \nSpeed: 2 \nCrit Chance: 15% \nCrit Damage: 175%",
		
		anim_idle: spr_PlayerIdle,
		anim_walk: spr_PlayerRunning,
		
		start_weapon: "Fireball",
		pDamage: 2,
		pSpeed: 2,
	},

	{
		sName: "Nyra Shadeveil", 
		desc: "A silent assassin from the Shadow Monastery. \nShe strikes unseen and vanishes into darkness. \nDeadly elegance in motion.",
		stats: "Damage: 2 \nSpeed: 3 \nCrit Chance: 30% \nCrit Damage: 150%",
		
		anim_idle: spr_PlayerIdle,
		anim_walk: spr_PlayerRunning,
		
		start_weapon: "Shortbow",
		pDamage: 2,
		pSpeed: 3,
	},

	{
		sName: "Gronk the Hungry", 
		desc: "Once a chef, now a rampaging beast. \nGronk smashes enemies and snacks alike. \nHe's not picky - everything is food.",
		stats: "Damage: 2.5 \nSpeed: 1 \nCrit Chance: 5% \nCrit Damage: 110%",
		
		anim_idle: spr_PlayerIdle,
		anim_walk: spr_PlayerRunning,
		
		start_weapon: "Javelin",
		pDamage: 2.5,
		pSpeed: 1,
	}
];


level_options = [
	{
		sName: "Green Outlands", 
		desc: "A calm, sunlit region of hills and meadows\nA gentle start for any adventurer.",
		stats: "Spawn Rate: +25% \nXP Rate: +50% \nEnemy Speed: +0% \nCoin Drop: +100%"
	},
	{
		sName: "Crimson Hollow", 
		desc: "A twisted forest steeped in fog and blood-red leaves.\nEnemies grow faster and more aggressive here.",
		stats: "Spawn Rate: +50% \nXP Rate: +100% \nEnemy Speed: +25% \nCoin Drop: +75%"
	},
	{
		sName: "Obsidian Depths", 
		desc: "An underground realm of fire and shadow.\nOnly the strong survive the relentless onslaught.",
		stats: "Spawn Rate: +100% \nXP Rate: +150% \nEnemy Speed: +50% \nCoin Drop: +50%"
	}
];

// Cursor
menu_index = 0;
menu_stage = 0; // 0 = pick character, 1 = pick level, 2 = start game
