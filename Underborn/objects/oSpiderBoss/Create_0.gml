// Inherit the parent event
event_inherited();

isBoss = true;

spr = sEnemySpider;
sprW = sEnemySpiderWhite;

scale = 2.5;

image_xscale = scale;
image_yscale = scale;

hp = 100;

edge_index = 0; // 0=top, 1=right, 2=bottom, 3=left
move_speed = 2;
web_cooldown = 0;
alarm[0] = 60; // first attack in 1 second