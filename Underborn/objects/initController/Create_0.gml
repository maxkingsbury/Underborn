if (!variable_global_exists("hasInitialized")) {
    global.hasInitialized = true;

    // Only run ONCE per game session
    window_set_fullscreen(true);

	global.isPaused = false;

	// Global weapon data
	global.weapon_data = ds_map_create();
	global.weapon_data[? "Slash"] = {name: "Slash", sprite: sSwordIcon};
	global.weapon_data[? "Twinblade"] = {name: "Twinblade", sprite: sTwinbladeIcon};
	global.weapon_data[? "Javelin"] = {name: "Javelin", sprite: sJavelinIcon};
	global.weapon_data[? "Bow"] = {name: "Bow", sprite: sShortbowIcon};
	global.weapon_data[? "Ice Shard"] = {name: "Ice Shard", sprite: sIceShardIcon};
	global.weapon_data[? "Fireball"] = {name: "Fireball", sprite: sFireballIcon};
	
	global.selected_character = "";
	global.selected_level = "";
	
	
	global.hp_max = 10;
	global.hp = global.hp_max;

	global.move_speed = 0;
	global.damage = 1;
	global.crit_chance = 0;
	global.can_dodge = false;
	global.dodge_cooldown = 900;
	global.firstPlay = true;
    global.diamonds = 4;
    global.coins = 300;
	global.upgrades = []
	
	global.upgrade_pool = [
	    sUpgradeTest,
	    sUpgradeTest_1,
	    sUpgradeTest_2,
		sUpgradeTest_3,
	    sUpgradeTest_4,
		sUpgradeTest_5,
		
	    // add more here
	];

	global.upgrades = [
	    { // 0 - Root node
	        name: "Health Up",
	        x: 0, y: 0,
	        cost_coins: 0, cost_diamonds: 0,
	        unlocked: true, purchased: false,
	        unlocks: [1, 2],
	        radius: 150, angle: 90
	    },
	    { // 1 - Left child of root
	        name: "Damage Up",
	        x: 0, y: 0,
	        cost_coins: 100, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        unlocks: [3],
	        radius: 150, angle: 210
	    },
	    { // 2 - Right child of root
	        name: "Speed Up",
	        x: 0, y: 0,
	        cost_coins: 100, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        unlocks: [4],
	        radius: 150, angle: -30
	    },
	    { // 3 - Child of Damage Up
	        name: "Critical Hit",
	        x: 0, y: 0,
	        cost_coins: 100, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        unlocks: [],
	        radius: 300, angle: 240
	    },

	    { // 4 - Second child of Speed Up
	        name: "Dodge Boost",
	        x: 0, y: 0,
	        cost_coins: 100, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        unlocks: [],
	        radius: 300, angle: -30
	    }
	];
}


global.selected_slot = -1;

