room_start_time = current_time;
pause_offset = 0;
pause_start_time = 0;
is_paused = false;

speed = 0;

alaTime = 1;
alaTime1 = 17;

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

// Test item struct (you can expand this later)
var test_item = {
    sprite: sSwordSpr
};
var test_item2 = {
    sprite: sTwinblade
};
var test_item3 = {
    sprite: sJavelin
};
var test_item4 = {
    sprite: sShortbow
};

slots[0] = test_item;
slots[1] = test_item2;
slots[2] = test_item3;
slots[3] = test_item4;

mx = mouse_x;
my = mouse_y;