function save_game(slot) {
    var save_data = create_save_data(); // Your custom save struct
    var json = json_stringify(save_data); // Convert it to a JSON string
    var filename = "save" + string(slot) + ".sav";

    // Write the JSON to file
    var file = file_text_open_write(filename);
    file_text_write_string(file, json);
    file_text_close(file);

    // Optionally, add confirmation flag or UI message
    global.last_save_time = current_time; // You can use this to show a save confirmation
}