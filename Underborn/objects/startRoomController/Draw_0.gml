// Draw fireflies
for (var i = 0; i < firefly_count; i++) {
    var f = fireflies[i];
    var glow = 0.5 + 0.5 * sin(degtorad(current_time / 10 + f.glow_phase)); // flicker
    draw_set_alpha(f.alpha * glow);
    draw_set_color(c_olive); // or make_color_rgb(180, 255, 180) for softer green
    draw_circle(f.x, f.y, f.size, false);
}
draw_set_alpha(1);