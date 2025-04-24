/// @function draw_text_shadow(x, y, string, shadow_color)
/// @param {real} x X position to draw text
/// @param {real} y Y position to draw text
/// @param {string} string Text to draw
/// @param {color} shadow_color Color of the shadow

function draw_text_shadow(x, y, string, shadow_color, xscale, yscale) {
    var current_color = draw_get_color();
    
    // Draw shadow
    draw_set_color(shadow_color);
    draw_text_transformed(x+(1*xscale), y+(1*yscale), string, xscale, yscale, 0);
    
    // Draw main text
    draw_set_color(current_color);
    draw_text_transformed(x, y, string, xscale, yscale, 0);
}