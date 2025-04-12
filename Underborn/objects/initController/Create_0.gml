if (!variable_global_exists("hasInitialized")) {
    global.hasInitialized = true;

    // Only run ONCE per game session
    window_enable_borderless_fullscreen(true);
    window_set_fullscreen(true);

    global.firstPlay = true;
    global.diamonds = 0;
    global.coins = 0;
    
    room_goto(startRoom);
}