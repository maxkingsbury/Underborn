/// @description Twinblade
if (instance_exists(oUpgrade) || global.isPaused == true) { exit; }
var twinblade = instance_create_layer(x, y, "Instances", oTwinblade);
twinblade.direction = irandom_range(45, 135);
twinblade.speed = 4;
twinblade.gravity = 0.1;
twinblade.friction = 0.01;

// Apply upgrade based on twinbladeLevel
switch (twinbladeLevel) {
    case 1:
        // Base twinblade
		twinblade.max_pierce = 5;
        break;
        
    case 2:
        twinblade.scale = 1.5;
		twinblade.max_pierce = 5;
        break;
        
    case 3:
        twinblade.scale = 1.5;
        twinblade.dmg += 2;
		twinblade.max_pierce = 5;
        break;
        
    case 4:
        twinblade.scale = 1.5;
        twinblade.dmg += 3;
		twinblade.max_pierce = 10;
        twinblade.friction = 0; // Travels further
        break;
        
    case 5:
        twinblade.scale = 1.5;
        twinblade.dmg += 4;
        twinblade.friction = 0;
        twinblade.max_pierce = 10; // Can hit 2 enemies
        break;
        
    case 6:
        twinblade.scale = 1.5;
        twinblade.dmg += 5;
        twinblade.friction = 0;
        twinblade.max_pierce = 10; // Can hit 3 enemies
        // Spawn a second twinblade at higher levels
        var twinblade2 = instance_create_layer(x, y, "Instances", oTwinblade);
        twinblade2.direction = irandom_range(45, 135);
        twinblade2.speed = 4;
        twinblade2.gravity = 0.1;
        twinblade2.friction = 0;
        twinblade2.scale = 1.5;
        twinblade2.dmg += 5;
        twinblade2.max_pierce = 25;
        break;
        
    case 7:
        twinblade.scale = 1.5;
        twinblade.dmg += 7;
        twinblade.friction = 0;
        twinblade.max_pierce = 25;
        twinblade.speed = 4; // Faster blade
        // Higher crit chance
        twinblade.crit_chance = 0.2; // 20% chance to crit
        
        // Spawn two more twinblades at max level
        for(var i = 0; i < 2; i++) {
            var twin = instance_create_layer(x, y, "Instances", oTwinblade);
            twin.direction = irandom_range(45, 135);
            twin.speed = 4;
            twin.gravity = 0.1;
            twin.friction = 0;
            twin.scale = 1.5;
            twin.dmg += 7;
            twin.max_pierce = 25;
            twin.crit_chance = 0.2;
        }
        break;
}