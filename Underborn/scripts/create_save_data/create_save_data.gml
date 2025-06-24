function create_save_data() {
	
	if (!variable_global_exists("last_save_time")) {
		var raw_time = date_datetime_string(date_current_datetime());
		if (string_pos("AM", raw_time) > 0 || string_pos("PM", raw_time) > 0) {
		    // Trim the last 3 characters if it ends with AM/PM
		    global.last_save_time = string_copy(raw_time, 1, string_length(raw_time) - 3);
		} else {
		    // Use the full string as-is
		    global.last_save_time = raw_time;
		}
	}
    return {
        coins: global.coins,
        diamonds: global.diamonds,
        upgrades: prepare_upgrades_for_save(),
        lastSave: global.last_save_time,
        firstPlay: global.firstPlay,
        volumeLevel: global.master_volume,
    };
}