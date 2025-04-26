walk_speed = 0.2;

hp = 1;

scale = 0.75;

image_xscale = scale;
image_yscale = scale;

last_x = x;
last_y = y;
stuck_timer = 0;

num = 1; 

// Initialize enemy properties

walk_speed = 0.2;
scale = 0.75;

invincibility = false;
invincibility_timer = 0;
invincibility_cooldown = 0; // NEW
hit_by_projectiles = ds_list_create();

image_xscale = scale;
image_yscale = scale;

push_timer = 1;