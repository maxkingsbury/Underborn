if (!variable_global_exists("upgrades")) {
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
	];
}

// Initializing children
for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];
    for (var j = 0; j < array_length(upg.unlocks); j++) {
        var child_index = upg.unlocks[j];
        global.upgrades[child_index].unlocks[array_length(global.upgrades[child_index].unlocks)] = i;
    }
}
