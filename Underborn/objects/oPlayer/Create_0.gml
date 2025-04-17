// Player movement speed
mvspd = global.selected_character.pSpeed;

image_speed = 1;

swordLevel = 0;
twinbladeLevel = 0;
javelinLevel = 0;
arrowLevel = 0;
iceShardLevel = 0;
fireballLevel = 0;

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
xpNext =75;

// TEMP: Create dummy accessory data for GUI test
if (!variable_global_exists("accessory_data")) {
    global.accessory_data = ds_map_create();

    var acc1 = {
        name: "Ring of Speed",
        sprite: sFireballIcon
    };
    var acc2 = {
        name: "Amulet of Power",
        sprite: sTwinbladeIcon
    };
    var acc3 = {
        name: "Cloak of Shadows",
        sprite: sSwordIcon
    };
    var acc4 = {
        name: "Boots of Haste",
        sprite: sIceShardIcon
    };

    global.accessory_data[? "ring_speed"] = acc1;
    global.accessory_data[? "amulet_power"] = acc2;
    global.accessory_data[? "cloak_shadow"] = acc3;
    global.accessory_data[? "boots_haste"] = acc4;
}

// TEMP: Assign dummy accessories to player slots
accessory = array_create(4);
accessory[0] = "ring_speed";
accessory[1] = undefined;
accessory[2] = "cloak_shadow";
accessory[3] = undefined;

for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];
	if (upg.purchased) {
		switch (upg.name) {
				case "Health Up":
							
					global.hp_max += 10;
					// global.player_hp = global.player_max_hp; // also heal if you want
					break;
        
				case "Damage Up":
					global.damage += 1;
					break;
        
				case "Speed Up":
					global.move_speed += 1;
					break;
        
				case "Critical Hit":
					global.crit_chance += 0.5; // 10%
					break;
        
				case "Dodge Boost":
					global.dodge_cooldown -= 300; // faster dodge?
					break;
		}
	}
}
