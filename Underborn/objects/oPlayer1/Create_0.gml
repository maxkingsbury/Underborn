// Player movement speed
image_speed = 1;
move_speed = global.selected_character.pSpeed;

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


slot[0] = "";
slot[1] = "";
slot[2] = "";
slot[3] = "";
slot[4] = "";
slot[5] = "";


damageSword = 3 * global.selected_character.pDamage;
damageTwinblade = 1 * global.selected_character.pDamage;
damageJavelin = 2 * global.selected_character.pDamage;
damageArrow = 2 * global.selected_character.pDamage;

collectRadius = 50;

xp = 0; 
xpNext = 5;
