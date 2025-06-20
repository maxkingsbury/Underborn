function reset_game(slot) {
    var default_save_data = {
        coins: 3000,
        diamonds: 40,
		firstPlay: true,
		volumeLevel: 0.5,
        upgrades: [
		    { // 0 - Root node
		        name: "Health Up",
		        x: 0, y: 0,
		        cost_coins: 10, cost_diamonds: 0,
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
		        cost_coins: 15, cost_diamonds: 1,
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
		        cost_coins: 15, cost_diamonds: 1,
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
		        cost_coins: 30, cost_diamonds: 2,
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
		        cost_coins: 30, cost_diamonds: 2,
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
		        cost_coins: 35, cost_diamonds: 2,
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
		        cost_coins: 35, cost_diamonds: 2,
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
		        cost_coins: 80, cost_diamonds: 5,
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
		        cost_coins: 80, cost_diamonds: 5,
		        unlocked: false, purchased: false,
		        level: 0, max_level: 1, 
		        cost_multiplier: 1.0,
		        effect_value: 0.5, // 50% chance to counter when dodging
		        unlocks: [],
		        radius: 450, angle: -30
		    }
		],
        selected_slot: slot  // Optionally store the slot number as the default value
    };

    var json = json_stringify(default_save_data);  // Convert to JSON
    var filename = "save" + string(slot) + ".sav";  // Filename for the selected slot
    // Write the JSON to file
    var file = file_text_open_write(filename);
    file_text_write_string(file, json);
    file_text_close(file);
	
    show_debug_message("Save slot " + string(slot) + " has been reset.");
}
