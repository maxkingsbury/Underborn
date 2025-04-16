// List of lore lines
lore_lines = [
    "You fell.",
    "Blade in your chest.\nAsh in your lungs.",
    "...",
    "The world turned away.",
	"But a silent watcher remained.",
    "...",
    "A voice echoed in the darkness",
    "It did not speak in words.\nIt spoke in will.",
    "...",
    "You were not saved.\nYou were chosen.",
    "Pulled from death, not for mercy - but for purpose.",
    "...",
    "Now you walk again.\nNot as you were, but as you must be.",
    "...",
    "Rise, underborn.\nThere is work yet to be done."
];

current_line = 0;
displayed_text = "";
text_speed = 2; 
char_timer = 0;
finished_line = false;
input_cooldown = 10;


firefly_count = 100;
fireflies = array_create(firefly_count);

for (var i = 0; i < firefly_count; i++) {
    fireflies[i] = {
        x: random(display_get_width()),
        y: random(display_get_height()),
        speed: random_range(0.1, 0.5),
        angle: random(360),
        size: random_range(2, 4),
        alpha: random_range(0.2, 0.7),
        glow_phase: random(360)
    };
}


