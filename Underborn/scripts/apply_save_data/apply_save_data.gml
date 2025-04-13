function apply_save_data(save_data) {
    // Restore permanent currencies
    global.coins = save_data.coins;
    global.diamonds = save_data.diamonds;
	global.upgrades = save_data.upgrades;
}