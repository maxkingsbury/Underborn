audio_play_sound(sndStartMenuMusic, 1, true);
if (!variable_global_exists("hasInitialized")) {
    global.hasInitialized = true;
	
	// Initialize player stats (recommended to put in a create event or game_start script)
	global.coins = 500;
	global.diamonds = 10;
	global.max_health = 100;
	global.current_health = 100;
	global.damage = 0;
	global.speed = 3;
	global.crit_chance = 0;
	global.crit_damage_multiplier = 2; // Default critical hits do 1.5x damage
	global.dodge_chance = 0;
	global.armor_penetration = 0;
	global.stamina_regen_rate = 1;
	global.counter_attack_chance = 0;

    // Only run ONCE per game session
    window_set_fullscreen(true);

	global.isPaused = false;

	global.weapon_data = ds_map_create();

	global.weapon_data = ds_map_create();
	global.weapon_data[? "Slash"] = {
	    name: "Slash", 
	    sprite: sSwordIcon, 
	    damage: 3, 
	    time: 100, 
	    crit_chance: 0, 
	    range: 50,
	    time_left: 0  // New field to track cooldown
	};

	global.weapon_data[? "Twinblade"] = {
	    name: "Twinblade", 
	    sprite: sTwinbladeIcon, 
	    damage: 1, 
	    time: 30, 
	    crit_chance: 0,  
	    range: 30,
	    time_left: 0
	};

	global.weapon_data[? "Javelin"] = {
	    name: "Javelin", 
	    sprite: sJavelinIcon, 
	    damage: 2, 
	    time: 60, 
	    crit_chance: 0, 
	    range: 100,
	    time_left: 0
	};

	global.weapon_data[? "Bow"] = {
	    name: "Bow", 
	    sprite: sShortbowIcon, 
	    damage: 1, 
	    time: 60, 
	    crit_chance: 0, 
	    range: 150,
	    time_left: 0
	};

	global.weapon_data[? "Ice Shard"] = {
	    name: "Ice Shard", 
	    sprite: sIceShardIcon, 
	    damage: 1, 
	    time: 15, 
	    crit_chance: 0,  
	    range: 80,
	    time_left: 0
	};

	global.weapon_data[? "Fireball"] = {
	    name: "Fireball", 
	    sprite: sFireballIcon, 
	    damage: 5, 
	    time: 60, 
	    crit_chance: 0, 
	    range: 100,
	    time_left: 0
	};
	
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
	        cost_coins: 100, cost_diamonds: 0,
	        unlocked: true, purchased: false,
	        level: 0, max_level: 5,
	        cost_multiplier: 1.5, // Cost increases by this factor each level
	        effect_value: 10, // +10 health per level
	        unlocks: [1, 2],
	        radius: 150, angle: 90
	    },
	    { // 1 - Left child of root
	        name: "Damage Up",
	        x: 0, y: 0,
	        cost_coins: 150, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        level: 0, max_level: 3,
	        cost_multiplier: 2.0,
	        effect_value: 1, // +5 damage per level
	        unlocks: [3, 5],
	        radius: 150, angle: 210
	    },
	    { // 2 - Right child of root
	        name: "Speed Up",
	        x: 0, y: 0,
	        cost_coins: 150, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        level: 0, max_level: 3,
	        cost_multiplier: 1.8,
	        effect_value: 0.2, // +20% speed per level
	        unlocks: [4, 6],
	        radius: 150, angle: -30
	    },
	    { // 3 - Child of Damage Up
	        name: "Critical Hit",
	        x: 0, y: 0,
	        cost_coins: 300, cost_diamonds: 2,
	        unlocked: false, purchased: false,
	        level: 0, max_level: 3,
	        cost_multiplier: 2.0,
	        effect_value: 0.1, // +10% crit chance per level
	        unlocks: [7],
	        radius: 300, angle: 240
	    },
	    { // 4 - Child of Speed Up
	        name: "Dodge Boost",
	        x: 0, y: 0,
	        cost_coins: 300, cost_diamonds: 2,
	        unlocked: false, purchased: false,
	        level: 0, max_level: 3,
	        cost_multiplier: 2.0,
	        effect_value: 0.05, // +5% dodge chance per level
	        unlocks: [8],
	        radius: 300, angle: -30
	    },
	    { // 5 - Second child of Damage Up
	        name: "Armor Pierce",
	        x: 0, y: 0,
	        cost_coins: 350, cost_diamonds: 2,
	        unlocked: false, purchased: false,
	        level: 0, max_level: 2,
	        cost_multiplier: 2.5,
	        effect_value: 0.1, // +10% armor penetration per level
	        unlocks: [],
	        radius: 300, angle: 180
	    },
	    { // 6 - Second child of Speed Up
	        name: "Stamina Regen",
	        x: 0, y: 0,
	        cost_coins: 350, cost_diamonds: 2,
	        unlocked: false, purchased: false,
	        level: 0, max_level: 2,
	        cost_multiplier: 2.5,
	        effect_value: 0.15, // +15% stamina regen per level
	        unlocks: [],
	        radius: 300, angle: 0
	    },
	    { // 7 - Tier 3 upgrade from Critical Hit
	        name: "Devastating Blow",
	        x: 0, y: 0,
	        cost_coins: 800, cost_diamonds: 5,
	        unlocked: false, purchased: false,
	        level: 0, max_level: 1,
	        cost_multiplier: 1.0,
	        effect_value: 0.5, // +50% critical damage
	        unlocks: [],
	        radius: 450, angle: 240
	    },
	    { // 8 - Tier 3 upgrade from Dodge Boost
	        name: "Counter Attack",
	        x: 0, y: 0,
	        cost_coins: 800, cost_diamonds: 5,
	        unlocked: false, purchased: false,
	        level: 0, max_level: 1, 
	        cost_multiplier: 1.0,
	        effect_value: 0.5, // 50% chance to counter when dodging
	        unlocks: [],
	        radius: 450, angle: -30
	    }
	];

}


global.selected_slot = -1;

