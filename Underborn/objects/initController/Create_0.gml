if (!variable_global_exists("hasInitialized")) {
    global.hasInitialized = true;

    // Only run ONCE per game session
    window_enable_borderless_fullscreen(true);
    window_set_fullscreen(true);

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

