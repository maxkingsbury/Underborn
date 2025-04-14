if (!variable_global_exists("hasInitialized")) {
    global.hasInitialized = true;

    // Only run ONCE per game session
    window_enable_borderless_fullscreen(true);
    window_set_fullscreen(true);

	// Global weapon data
	global.weapon_data = ds_map_create();
	global.weapon_data[? "Slash"] = {name: "Slash", sprite: sSwordSpr};
	global.weapon_data[? "Twinblade"] = {name: "Twinblade", sprite: sTwinblade};
	global.weapon_data[? "Javelin"] = {name: "Javelin", sprite: sJavelin};
	global.weapon_data[? "Bow"] = {name: "Bow", sprite: sShortbow};
	
	global.selected_character = "";
	global.selected_level = "";
	
	global.firstPlay = true;
    global.diamonds = 10;
    global.coins = 500;
	global.upgrades = []
	
	global.upgrade_pool = [
	    sUpgradeTest,
	    sUpgradeTest_1,
	    sUpgradeTest_2,
	    // add more here
	];

}


global.selected_slot = -1;

