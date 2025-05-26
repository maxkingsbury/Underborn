global.enemiesKilled = 0;
global.coinsThisRound = 0;
global.isPaused = false;

var player = instance_create_layer(1600, 1600, "Instances", oPlayer);
var c = global.selected_character;

player.sprite_index = c.anim_idle;
player.pDamage = c.pDamage;
player.pSpeed = c.pSpeed;
player.slot[0] = c.start_weapon;

room_start_time = current_time;
pause_offset = 0;
pause_start_time = 0;
is_paused = false;

speed = 0;

enemyHpMult = 1;

alaTime = 1;
alaTime1 = 10;

//enemy spawning
alarmSpawnTime = 15;

boss1_spawned = false;


alarm[0] = alaTime;
alarm[1] = alaTime1;
alarm[2] = alarmSpawnTime;


// collecting coins
alaTime3 = 10;
alarm[3] = alaTime3;

// Inventory system
slot_count = 6;
slots = array_create(slot_count, undefined);
dragging_item = undefined;


mx = mouse_x;
my = mouse_y;