randomize();
global.boss_to_spawn = global.boss_pool[irandom(array_length(global.boss_pool) - 1)];

room_goto(bossRoom);
