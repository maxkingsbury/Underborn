/// Step Event — Level / Character Select Menu

// --------------------------------------------------
// LAYOUT 
// --------------------------------------------------
var cx = surface_get_width(application_surface) / 2;
var cy = 300;

var item_height = 40;
var item_width  = 600;

// --------------------------------------------------
// KEYBOARD NAVIGATION
// --------------------------------------------------
if (keyboard_check_pressed(vk_up)) {
    menu_index = max(menu_index - 1, 0);

    if (menu_stage == 0 || menu_stage == 1) {
        audio_play_sound(sndMove, 0.5, false);
    }
}

if (keyboard_check_pressed(vk_down)) {
    if (menu_stage == 0) {
        menu_index = min(menu_index + 1, array_length(character_options) - 1);
        audio_play_sound(sndMove, 0.5, false);
    }
    else if (menu_stage == 1) {
        menu_index = min(menu_index + 1, array_length(level_options) - 1);
        audio_play_sound(sndMove, 0.5, false);
    }
}

// --------------------------------------------------
// CONFIRM
// --------------------------------------------------
if (keyboard_check_pressed(vk_enter)) {

    audio_play_sound(sndConfirm, 0.5, false);

    if (menu_stage == 0) {
        character_selected = true;
        global.selected_character = character_options[menu_index];

        var char = global.selected_character;
        slot[0] = global.weapon_data[? char.start_weapon];

        menu_index = 0;
        menu_stage = 1;
    }
    else if (menu_stage == 1) {
        level_selected = true;
        global.selected_level = level_options[menu_index];
        menu_stage = 2;
    }
    else if (menu_stage == 2) {
        room_goto(gameRoom);
    }
}

// --------------------------------------------------
// DETERMINE ACTIVE OPTIONS
// --------------------------------------------------
var options;

if (menu_stage == 0) {
    options = character_options;
}
else if (menu_stage == 1) {
    options = level_options;
}
else {
    options = undefined;
}

// --------------------------------------------------
// MOUSE HOVER DETECTION
// --------------------------------------------------
var mouse_over_index = -1;

if (options != undefined) {
    for (var i = 0; i < array_length(options); i++) {

        var x1 = cx - item_width / 2;
        var x2 = cx + item_width / 2;
        var y1 = cy + i * item_height;
        var y2 = y1 + item_height;

        if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
            mouse_over_index = i;
            break;
        }
    }
}

// --------------------------------------------------
// MOUSE HOVER → SELECTION
// --------------------------------------------------
if (mouse_over_index != -1 && mouse_over_index != menu_index) {
    menu_index = mouse_over_index;
    audio_play_sound(sndMove, 0.5, false);
}

// --------------------------------------------------
// MOUSE CLICK = CONFIRM
// --------------------------------------------------
if (mouse_check_button_pressed(mb_left) && mouse_over_index != -1) {

    audio_play_sound(sndConfirm, 0.5, false);

    if (menu_stage == 0) {
        character_selected = true;
        global.selected_character = character_options[menu_index];

        var char = global.selected_character;
        slot[0] = global.weapon_data[? char.start_weapon];

        menu_index = 0;
        menu_stage = 1;
    }
    else if (menu_stage == 1) {
        level_selected = true;
        global.selected_level = level_options[menu_index];
        menu_stage = 2;
    }
    else if (menu_stage == 2) {
        room_goto(gameRoom);
    }
}

// --------------------------------------------------
// CURSOR FEEDBACK
// --------------------------------------------------
window_set_cursor(
    (mouse_over_index != -1 && menu_stage < 2)
    ? cr_handpoint
    : cr_default
);
