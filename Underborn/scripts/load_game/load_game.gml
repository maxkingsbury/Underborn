function load_game(slot) {
    var filename = "save" + string(slot) + ".sav";

    if (file_exists(filename)) {
        var file = file_text_open_read(filename);
        var json = file_text_read_string(file);
        file_text_close(file);

        var loaded_data = json_parse(json);
        apply_save_data(loaded_data); // Your custom function to restore variables
    } else {
        show_debug_message("No save file found for slot " + string(slot));
    }
}