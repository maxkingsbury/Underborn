/// @description Sword
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }
var slash = instance_create_layer(x, y, "Instances", oSword);

if (swordLevel > 7) {
	swordLevel = 7;
}

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
        swordTime = 90; // 10% faster cooldown
        break;
        
    case 4:
        slash.scale = 2.0;
        slash.dmg += 3;
        slash.max_pierce = 100;
        swordTime = 90; // 10% faster cooldown
        break;
        
    case 5:
        slash.scale = 2.2;
        slash.dmg += 4;
        slash.max_pierce = 100;
        swordTime = 80; // 20% faster cooldown
        
        // Add a second slash at level 5
        var slash2 = instance_create_layer(x, y, "Instances", oSword);
        slash2.image_angle = slash.image_angle + 180; // Opposite direction
		slash2.addX = -25;
        slash2.scale = 2.2;
        slash2.dmg += 4;
        slash2.max_pierce = 100;
        break;
        
    case 6:
        slash.scale = 2.5;
        slash.dmg += 6;
        slash.max_pierce = 100;
        swordTime = 70; // 30% faster cooldown
        
        // Second slash
        var slash2 = instance_create_layer(x, y, "Instances", oSword);
        slash2.image_angle = slash.image_angle + 180;
		slash2.addX = -25;
        slash2.scale = 2.5;
        slash2.dmg += 6;
        slash2.max_pierce = 100;
        break;
        
    case 7:
        slash.scale = 2.5;
        slash.dmg += 8;
        slash.max_pierce = 100;
        slash.crit_chance = 0.25; // 25% chance to crit
        swordTime = 60; // 40% faster cooldown
        
        // Second slash
        var slash2 = instance_create_layer(x, y, "Instances", oSword);
        slash2.image_angle = slash.image_angle + 180;
		slash2.addX = -25;
        slash2.scale = 2.5;
        slash2.dmg += 8;
        slash2.max_pierce = 100;
		slash2.crit_chance = 0.25
        break;
}