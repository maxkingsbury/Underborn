function reset_game(slot) {
    var default_save_data = {
        coins: 0,
        diamonds: 0,
        upgrades: [
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
	        unlocks: [4, 5],
	        radius: 150, angle: -30
	    },
	    { // 3 - Child of Damage Up
	        name: "Critical Hit",
	        x: 0, y: 0,
	        cost_coins: 100, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        unlocks: [],
	        radius: 250, angle: 240
	    },
	    { // 4 - First child of Speed Up
	        name: "Sprint",
	        x: 0, y: 0,
	        cost_coins: 100, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        unlocks: [],
	        radius: 200, angle: -70
	    },
	    { // 5 - Second child of Speed Up
	        name: "Dodge Boost",
	        x: 0, y: 0,
	        cost_coins: 100, cost_diamonds: 1,
	        unlocked: false, purchased: false,
	        unlocks: [],
	        radius: 300, angle: -30
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
