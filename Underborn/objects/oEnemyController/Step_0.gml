// Clear the grid
ds_grid_clear(enemy_grid, 0);

// Populate the grid with enemy lists
with (oEnemyParent) {
    var gx = floor(x / other.grid_size);
    var gy = floor(y / other.grid_size);
    
    // Keep coordinates within grid bounds
    gx = clamp(gx, 0, other.grid_width-1);
    gy = clamp(gy, 0, other.grid_height-1);
    
    // Create list if it doesn't exist
    if (!ds_grid_get(other.enemy_grid, gx, gy)) {
        ds_grid_set(other.enemy_grid, gx, gy, ds_list_create());
    }
    
    // Add enemy to the list
    var list = ds_grid_get(other.enemy_grid, gx, gy);
    ds_list_add(list, id);
}

// Process only a portion of the grid each frame
var cells_per_frame = 10; // Adjust based on performance
var total_cells = grid_width * grid_height;

for (var i = 0; i < cells_per_frame; i++) {
    var cell_index = (process_count + i) % total_cells;
    var gx = cell_index % grid_width;
    var gy = floor(cell_index / grid_width);
    
    var list = ds_grid_get(enemy_grid, gx, gy);
    if (list) {
        // Get nearby cells (including current cell)
        for (var nx = max(0, gx-1); nx <= min(grid_width-1, gx+1); nx++) {
            for (var ny = max(0, gy-1); ny <= min(grid_height-1, gy+1); ny++) {
                var neighbor_list = ds_grid_get(enemy_grid, nx, ny);
                if (neighbor_list) {
                    // Process collisions between all enemies in current cell and neighbor cell
                    ProcessCellCollisions(list, neighbor_list);
                }
            }
        }
    }
}


process_count = (process_count + cells_per_frame) % total_cells;

// In the Step Event, after processing collisions
// Clean up all lists to prevent memory leaks
for (var gx = 0; gx < grid_width; gx++) {
    for (var gy = 0; gy < grid_height; gy++) {
        var list = ds_grid_get(enemy_grid, gx, gy);
        if (list) {
            ds_list_clear(list);
            ds_list_destroy(list);
            ds_grid_set(enemy_grid, gx, gy, 0);
        }
    }
}