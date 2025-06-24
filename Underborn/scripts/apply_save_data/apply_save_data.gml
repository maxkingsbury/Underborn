function apply_save_data(save_data) {
    global.coins = save_data.coins;
    global.diamonds = save_data.diamonds;
    global.master_volume = save_data.volumeLevel;

    if (variable_struct_exists(save_data, "upgrades")) {
        global.upgrades = deep_copy_upgrades(save_data.upgrades);
    } else {
        show_debug_message("Warning: No upgrades found in save data");
    }

    if (variable_struct_exists(save_data, "firstPlay")) {
        global.firstPlay = save_data.firstPlay;
    }

    if (variable_struct_exists(save_data, "lastSave")) {
        global.last_save_time = save_data.lastSave;
    } else {
        global.last_save_time = "Never saved";
    }

    // Rebuild parents after loading
    upgrade_controller_rebuild_parents();
}