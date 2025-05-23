function apply_save_data(save_data) {
    // Restore permanent currencies
    global.coins = save_data.coins;
    global.diamonds = save_data.diamonds;
	global.upgrades = save_data.upgrades;
	global.master_volume = save_data.volumeLevel;

	if (variable_struct_exists(save_data, "firstPlay")) {
	    global.firstPlay = save_data.firstPlay;
	}
	
	if (variable_struct_exists(save_data, "last_save_time")) {
        global.last_save_time = save_data.last_save_time;
    } else {
        global.last_save_time = "Never saved";
    }
}