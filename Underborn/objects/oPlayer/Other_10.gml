/// @description Sword
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }
var slash = instance_create_layer(x, y, "Instances", oSword);

// Apply upgrade based on swordLevel
switch (swordLevel) {
    case 1:
        // Base sword slash
		slash.max_pierce = 100;
        break;
        
    case 2:
        slash.scale = 1.5;
        slash.dmg += 1;
		slash.max_pierce = 100;
        break;
        
    case 3:
        slash.scale = 1.8;
        slash.dmg += 2;
		slash.max_pierce = 100;
        // Add faster swing speed at level 3
        alarm[0] *= 0.9; // 10% faster cooldown
        break;
        
    case 4:
        slash.scale = 2.0;
        slash.dmg += 3;
        slash.max_pierce = 100;
        alarm[0] *= 0.9; // 10% faster cooldown
        break;
        
    case 5:
        slash.scale = 2.2;
        slash.dmg += 4;
        slash.max_pierce = 100;
        alarm[0] *= 0.8; // 20% faster cooldown
        
        // Add a second slash at level 5
        var slash2 = instance_create_layer(x, y, "Instances", oSword);
        slash2.image_angle = slash.image_angle + 180; // Opposite direction
        slash2.scale = 2.2;
        slash2.dmg += 4;
        slash2.max_pierce = 100;
        break;
        
    case 6:
        slash.scale = 2.5;
        slash.dmg += 6;
        slash.max_pierce = 100;
        alarm[0] *= 0.7; // 30% faster cooldown
        
        // Second slash
        var slash2 = instance_create_layer(x, y, "Instances", oSword);
        slash2.image_angle = slash.image_angle + 180;
        slash2.scale = 2.5;
        slash2.dmg += 6;
        slash2.max_pierce = 100;
        break;
        
    case 7:
        slash.scale = 3.0;
        slash.dmg += 8;
        slash.max_pierce = 100;
        slash.crit_chance = 0.25; // 25% chance to crit
        alarm[0] *= 0.6; // 40% faster cooldown
        
        // Create a full 360-degree attack at max level
        for(var i = 1; i <= 3; i++) {
            var extra_slash = instance_create_layer(x, y, "Instances", oSword);
            extra_slash.image_angle = slash.image_angle + (90 * i);
            extra_slash.scale = 3.0;
            extra_slash.dmg += 8;
            extra_slash.max_pierce = 100;
            extra_slash.crit_chance = 0.25;
        }
        break;
}