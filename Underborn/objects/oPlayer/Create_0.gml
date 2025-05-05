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

// TEMP: Create dummy accessory data for GUI test
if (!variable_global_exists("accessory_data")) {
    // Add this when setting up your accessory_data map
	global.accessory_data = ds_map_create();

	// Example accessory with effects
	global.accessory_data[? "speed_ring"] = {
	    name: "Speed Ring",
	    sprite: sSpeedRing,
	    effect_type: "stat_boost",
	    stat: "speed",
	    value: 1.5
	};

	global.accessory_data[? "health_charm"] = {
	    name: "Health Charm",
	    sprite: sHealthCharm,
	    effect_type: "stat_boost",
	    stat: "max_health",
	    value: 20
	};

	global.accessory_data[? "damage_ring"] = {
	    name: "Ring of Power",
	    sprite: sDamageRing,
	    effect_type: "stat_boost",
	    stat: "damage",
	    value: 1.2
	};

	global.accessory_data[? "turtle_shield"] = {
	    name: "Turtle Shield",
	    sprite: sTurtleShield,
	    effect_type: "status_effect",
	    status: "shield",
	    duration: 5 // Seconds to activate when hit
	};
}

// TEMP: Assign dummy accessories to player slots
accessory = array_create(4);
accessory[0] = "health_charm";
accessory[1] = "speed_ring";
accessory[2] = "turtle_shield";
accessory[3] = undefined;

// Player base stats (without accessories)
base_max_health = 100;
base_damage = 1;

// Current modified stats (will be updated with accessories)
movement_speed = mvspd;
max_health = base_max_health;

// Status effects
has_shield = false;
shield_timer = 0;
apply_accessory_effects();

// Accessory system
function apply_accessory_effects() {
    // Reset stats to base values
    movement_speed = mvspd;
    max_health = base_max_health;
	
    
    // Apply each equipped accessory's effect
    for (var i = 0; i < array_length(accessory); i++) {
        var acc_id = accessory[i];
        if (acc_id != "") {
            var acc_data = global.accessory_data[? acc_id];
            if (acc_data != undefined) {
                switch(acc_data.effect_type) {
                    case "stat_boost":
                        switch(acc_data.stat) {
                            case "speed":
                                movement_speed *= acc_data.value;
                                break;
                            case "max_health":
                                max_health += acc_data.value;
                                break;
                        }
                        break;
                    case "status_effect":
                        // Status effects are usually checked when needed
                        // For example, shield will be checked when taking damage
                        break;
                }
            }
        }
    }
    
    // Make sure current health doesn't exceed new max health
    //if (hp > max_health) hp = max_health;
}

