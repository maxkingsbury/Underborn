/// @function apply_upgrade(index)
/// @param index The index of the upgrade in global.upgrades

function apply_upgrade(index) {
    var upgrade = global.upgrades[argument0];

    // Skip if already purchased
    if (upgrade.purchased) return;

    // Check if the player has enough resources
    if (global.coins < upgrade.cost_coins || global.diamonds < upgrade.cost_diamonds) return;

    // Pay the cost
    global.coins -= upgrade.cost_coins;
    global.diamonds -= upgrade.cost_diamonds;

    // Mark as purchased
    upgrade.purchased = true;
    global.upgrades[argument0] = upgrade;

    // Apply the effect
    with (oPlayer) {
        switch (upgrade.name) {
            case "Health Up": health_max += 20; health = health_max; break;
            case "Damage Up": damage += 5; break;
            case "Speed Up": speed += 1; break;
            case "Critical Hit": crit_chance += 0.1; break;
            case "Sprint": sprint_speed += 2; break;
            case "Dodge Boost": can_dodge = true; break;
        }
    }

    // Unlock next upgrades
    for (var i = 0; i < array_length(upgrade.unlocks); i++) {
        var next_id = upgrade.unlocks[i];
        global.upgrades[next_id].unlocked = true;
    }
}
