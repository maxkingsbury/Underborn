function save_game(slot) {
    var save_data = create_save_data();
	
    var raw_time = date_datetime_string(date_current_datetime());
	if (string_pos("AM", raw_time) > 0 || string_pos("PM", raw_time) > 0) {
		// Trim the last 3 characters if it ends with AM/PM
		global.last_save_time = string_copy(raw_time, 1, string_length(raw_time) - 3);
	} else {
		// Use the full string as-is
		global.last_save_time = raw_time;
	}
    
    save_data.last_save_time = global.last_save_time;
	
	
    var json = json_stringify(save_data); // Convert it to a JSON string
    var filename = "save" + string(slot) + ".sav";

    // Write the JSON to file
    var file = file_text_open_write(filename);
    file_text_write_string(file, json);
    file_text_close(file);
}