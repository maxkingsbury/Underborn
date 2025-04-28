grid_size = 64; // Size of each grid cell
grid_width = ceil(room_width / grid_size);
grid_height = ceil(room_height / grid_size);
enemy_grid = ds_grid_create(grid_width, grid_height);
process_count = 0; // For staggered processing

// In the Create Event of oEnemyController
enemy_grid = ds_grid_create(grid_width, grid_height);

