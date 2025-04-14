// Player movement speed
move_speed = round(1 + (global.selected_character.pSpeed/5));
image_speed = 1;

swordTime = 20;
twinbladeTime = 30;
javelinTime = 60;
arrowTime = 20;

alarm[0] = swordTime;
alarm[1] = twinbladeTime;
alarm[2] = javelinTime;
alarm[3] = arrowTime;
alarm[4] = 100;
alarm[5] = 100;

var char = global.selected_character;
slot[0] = global.weapon_data[? char.start_weapon];
slot[1] = undefined;
slot[2] = undefined;
slot[3] = undefined;
slot[4] = undefined;
slot[5] = undefined;

damageSword = 3 * global.selected_character.pDamage;
damageTwinblade = 1 * global.selected_character.pDamage;
damageJavelin = 2 * global.selected_character.pDamage;
damageArrow = 2 * global.selected_character.pDamage;

collectRadius = 50;

xp = 0; 
xpNext = 5;
