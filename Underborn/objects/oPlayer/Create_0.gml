// Player movement speed
mvspd = global.move_speed + global.selected_character.pSpeed;

image_speed = 1;

swordTime = 20;
twinbladeTime = 30;
javelinTime = 60;
arrowTime = 20;
iceShardTime = 15;
fireballTime = 60;

alarm[0] = swordTime;
alarm[1] = twinbladeTime;
alarm[2] = javelinTime;
alarm[3] = arrowTime;
alarm[4] = iceShardTime;
alarm[5] = fireballTime;

var char = global.selected_character;
slot[0] = global.weapon_data[? char.start_weapon];
slot[1] = undefined;
slot[2] = undefined;
slot[3] = undefined;
slot[4] = undefined;
slot[5] = undefined;

damageSword = 3 * global.selected_character.pDamage * global.damage;
damageTwinblade = 1 * global.selected_character.pDamage * global.damage;
damageJavelin = 2 * global.selected_character.pDamage * global.damage;
damageArrow = 2 * global.selected_character.pDamage * global.damage;
damageIceShard = 1 * global.selected_character.pDamage * global.damage;
damageFireball = 3 * global.selected_character.pDamage * global.damage;

collectRadius = 50;

xp = 0; 
xpNext = 5;


