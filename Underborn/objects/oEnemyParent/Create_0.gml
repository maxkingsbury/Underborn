walk_speed = 0.2;
burn_timer = 0;
rand = random(1);

collision_check_timer = irandom(15);

hp = 1;
isBoss = false;
scale = 0.75;

image_xscale = scale;
image_yscale = scale;

last_x = x;
last_y = y;
stuck_timer = 0;

num = 1; 
canDrop = true;
// Initialize enemy properties

walk_speed = 0.4;
scale = 0.75;

just_spawned = true;
unstick_frames = 5;

invincibility = false;
invincibility_timer = 0;
invincibility_cooldown = 0;
hit_by_projectiles = ds_list_create();

image_xscale = scale;
image_yscale = scale;

push_timer = 1;