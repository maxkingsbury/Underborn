audio_play_sound(sndStartMenuMusic, 1, true);
if (!variable_global_exists("hasInitialized")) {
    global.hasInitialized = true;
	global.master_volume = 0.5; // range 0.0 to 1.0
	
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
	global.weapon_data[? "Slash"] = {
	    name: "Slash", 
	    sprite: sSwordIcon, 
		upgradeSprite: sUpgradeTest,
	    damage: 3, 
	    time: 100, 
	    crit_chance: 0, 
	    range: 50,
	    time_left: 0,  // New field to track cooldown
		description: "A heavy hitting melee attack",
        levelEffects: [
            "Base damage: 3",
            "+1 damage, +50% bigger swing size",
            "+2 damage, +30% bigger swing size",
            "+3 damage, \n+20% bigger swing size, \n10% faster swing speed",
            "+4 damage, \n+20% bigger swing size, \n10% faster swing speed",
			"+6 damage, \n+30% bigger swing size, \n10% faster swing speed",
			"+8 damage, \n10% faster swing speed",
        ]
	};

	global.weapon_data[? "Twinblade"] = {
	    name: "Twinblade", 
	    sprite: sTwinbladeIcon, 
		upgradeSprite: sUpgradeTest_5,
	    damage: 1, 
	    time: 30, 
	    crit_chance: 0,  
	    range: 30,
	    time_left: 0,
		description: "Throw twinblades into the air",
        levelEffects: [
            "Base damage: 1, maximum of 5 pierces",
            "+25% size",
            "+2 damage",
            "+3 damage, +5 piercing",
            "+4 damage, +5 piercing",
			"+5 damage, throw a second twinblade",
			"+7 damage, +5 piercing, \n+20% crit chance, \nthrow a third twinblade",
        ]
	};

	global.weapon_data[? "Javelin"] = {
	    name: "Javelin", 
	    sprite: sJavelinIcon, 
		upgradeSprite: sUpgradeTest_4,
	    damage: 2, 
	    time: 60, 
	    crit_chance: 0, 
	    range: 100,
	    time_left: 0,
		description: "this weapon will be delet :(",
        levelEffects: [
            "Base damage: 12, slow attack",
            "+4 damage, reduced cooldown",
            "+5 damage, penetrates armor",
            "+6 damage, larger hitbox",
            "+8 damage, returns to player"
        ]
	};

	global.weapon_data[? "Bow"] = {
	    name: "Bow", 
	    sprite: sShortbowIcon, 
		upgradeSprite: sUpgradeTest_3,
	    damage: 1, 
	    time: 60, 
	    crit_chance: 0, 
	    range: 150,
	    time_left: 0,
		description: "Basic arrow attacks",
        levelEffects: [
            "Base damage: 1\n Speed: 3",
            "+1 damage\n +0.5 speed",
            "+2 damage\n +1 pierce",
            "+3 damage\n +0.5 speed",
            "+4 damage",
			"+5 damage\n +0.5 speed\n +15% crit chance",
			"+7 damage, +0.5 speed\n +5% crit chance\n +1 pierce"
        ]
	};

	global.weapon_data[? "Ice Shard"] = {
	    name: "Ice Shard", 
	    sprite: sIceShardIcon, 
		upgradeSprite: sUpgradeTest_2,
	    damage: 1, 
	    time: 15, 
	    crit_chance: 0,  
	    range: 80,
	    time_left: 0,
		description: "Ice projectiles that shoot quickly",
        levelEffects: [
            "Base damage: 1",
            "+1 damage, +1 shard",
			"+2 damage, +0.2 speed",
			"+3 damage, +1 pierce\n +1 shard",
			"+4 damage, +0.3 speed\n 20% bigger shards",
			"+5 damage, 10% bigger shards\n  +1 shard",
			"+6 damage, +0.5 speed\n  +1 pierce\n  20% bigger shards",

        ]
	};

	global.weapon_data[? "Fireball"] = {
	    name: "Fireball", 
	    sprite: sFireballIcon, 
	    upgradeSprite: sUpgradeTest_1,
	    damage: 5, 
	    time: 60, 
	    crit_chance: 0, 
	    range: 100,
	    time_left: 0,
	    description: "Heavy explosive magic that sets enemies ablaze.",
	    levelEffects: [
	        "Base damage: 5\nExplodes on hit (20 radius)\nPierces 1 enemy",
	        "+2 damage\n+20% explosion radius",
	        "+1 damage\nFires 2 projectiles\n+50% explosion radius",
	        "+1 damage\nPierces 2 enemies\nSlightly larger projectile",
	        "+1 damage\nApplies burn (1 DPS, 2s)",
	        "+2 damage\nFires 3 orbiting fireballs\nApplies burn (2 DPS, 3s)",
	        "+1 damage\n+10% crit chance\n+3 DPS burn (4s)\nFireballs pierce 3 enemies\nAdds 2 homing fireballs"
	    ]
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

