// In the Clean Up Event of oEnemyController
for (var gx = 0; gx < grid_width; gx++) {
    for (var gy = 0; gy < grid_height; gy++) {
        var list = ds_grid_get(enemy_grid, gx, gy);
        if (list) ds_list_destroy(list);
    }
}
ds_grid_destroy(enemy_grid);