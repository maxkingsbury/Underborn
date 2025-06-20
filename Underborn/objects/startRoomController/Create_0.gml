
angle = 0;

audio_master_gain(global.master_volume);
save_game(global.selected_slot);

firefly_count = 80;
fireflies = array_create(firefly_count);


var color_choices = [c_red, c_orange];

for (var i = 0; i < firefly_count; i++) {
    fireflies[i] = {
        x: random(display_get_gui_width()),
        y: random(display_get_gui_height()),
        speed: random_range(0.1, 0.5),
        angle: random(360),
        size: random_range(1, 2),
        alpha: random_range(0.2, 0.7),
        glow_phase: random(360),
        color: color_choices[irandom(array_length(color_choices) - 1)]
    };
}
