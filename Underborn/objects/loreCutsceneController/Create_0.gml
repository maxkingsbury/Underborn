// List of lore lines
lore_lines = [
	"",
    "They called it death... \n But for you, it was only the beginning.",
    "...",
    "Your body, broken.",
    "Your soul, cast into the hollow place between worlds.",
    "...",
    "Yet something, maybe someone, reached into the void.",
    "A flicker of light; a whisper of power.",
    "...",
    "Now you are bound by forces you don't understand,\n you rise not alive,\n but not truly dead either.",
    "...",
    "In this realm of shadows\n you must fight through endless waves of lost souls.",
    "...",
    "Each battle brings you closer... To truth.",
    "To the world you left behind.",
    "...",
    "This is not only your rebirth.\n This is your reckoning..."
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


