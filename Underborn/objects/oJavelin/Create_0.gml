// Inherit the parent event
event_inherited();

dmg = global.weapon_data[? "Javelin"].damage;
crit_chance = global.weapon_data[? "Javelin"].crit_chance + global.crit_chance;

image_xscale = 1;
image_yscale = 1;

// Add javelin-specific variables
max_pierce = 3;    // Maximum number of enemies this can pierce before destroying
