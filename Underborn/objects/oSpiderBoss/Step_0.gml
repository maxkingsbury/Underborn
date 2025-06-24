// Inherit the parent event
event_inherited();

// Move along screen edge
var margin = 32; // distance from wall

switch (edge_index) {
    case 0: // top
        x += move_speed;
        y = margin;
        if (x >= room_width - margin) edge_index = 1;
        break;
    case 1: // right
        y += move_speed;
        x = room_width - margin;
        if (y >= room_height - margin) edge_index = 2;
        break;
    case 2: // bottom
        x -= move_speed;
        y = room_height - margin*1.5;
        if (x <= margin) edge_index = 3;
        break;
    case 3: // left
        y -= move_speed;
        x = margin;
        if (y <= margin) edge_index = 0;
        break;
}

// Attack cooldown
if (web_cooldown > 0) {
    web_cooldown--;
}
