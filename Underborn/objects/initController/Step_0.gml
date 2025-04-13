var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

for (var i = 0; i < 3; i++) {
    var yy = 200 + i * 80;

    if (mx > display_get_gui_width()/2 - 100 && mx < display_get_gui_width()/2 + 100 &&
        my > yy - 30 && my < yy + 30 &&
        mouse_check_button_pressed(mb_left)) {
        
        global.selected_slot = i + 1;
        load_game(global.selected_slot); // ← loads data into globals
        room_goto(startRoom);       // ← go to your start room
    }
}