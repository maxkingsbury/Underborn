// Player movement speed
mvspd = global.selected_character.pSpeed;
// Sub-pixel movement tracking
x_remainder = 0;
y_remainder = 0;
image_speed = 1;

swordLevel = 0;
twinbladeLevel = 0;
javelinLevel = 0;
arrowLevel = 0;
iceShardLevel = 0;
fireballLevel = 0;

swordTime = global.weapon_data[? "Slash"].time;
twinbladeTime = global.weapon_data[? "Twinblade"].time;
javelinTime = global.weapon_data[? "Javelin"].time;
arrowTime = global.weapon_data[? "Bow"].time;
iceShardTime = global.weapon_data[? "Ice Shard"].time;
fireballTime = global.weapon_data[? "Fireball"].time;

alarm[0] = swordTime;
alarm[1] = twinbladeTime;
alarm[2] = javelinTime;
alarm[3] = arrowTime;
alarm[4] = iceShardTime;
alarm[5] = fireballTime;
		
var char = global.selected_character;
slot[0] = global.weapon_data[? char.start_weapon];
var weapon_struct = global.weapon_data[? char.start_weapon];
var weapon_name = weapon_struct.name;

switch (weapon_name) {
	case "Slash":      swordLevel = 1; break;
	case "Twinblade":  twinbladeLevel = 1; break;
	case "Javelin":    javelinLevel = 1; break;
	case "Bow":        arrowLevel = 1; break;
	case "Ice Shard":  iceShardLevel = 1; break;
	case "Fireball":   fireballLevel = 1; break;
	// Add more as needed...
}
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

level = 1;
xp = 0; 
xpNext = 20;

// Player base stats (without accessories)
base_max_health = 100;
base_damage = 1;

// Current modified stats (will be updated with accessories)
movement_speed = mvspd;
max_health = base_max_health;
