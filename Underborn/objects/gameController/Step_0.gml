if (instance_exists(oUpgrade)) {
    if (!is_paused) {
        is_paused = true;
        pause_start_time = current_time;
    }
} else {
    if (is_paused) {
        is_paused = false;
        pause_offset += current_time - pause_start_time;
    }
}