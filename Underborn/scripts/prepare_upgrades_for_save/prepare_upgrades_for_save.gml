function prepare_upgrades_for_save() {
    var upgrades_for_save = [];
    for (var i = 0; i < array_length(global.upgrades); i++) {
        var u = global.upgrades[i];
        var copy = {};
        copy.name = u.name;
        copy.x = u.x;
        copy.y = u.y;
        copy.cost_coins = u.cost_coins;
        copy.cost_diamonds = u.cost_diamonds;
        copy.unlocked = u.unlocked;
        copy.purchased = u.purchased;
        copy.level = u.level;
        copy.max_level = u.max_level;
        copy.cost_multiplier = u.cost_multiplier;
        copy.effect_value = u.effect_value;
        copy.unlocks = clone_1d_array(u.unlocks);
        copy.radius = u.radius;
        copy.angle = u.angle;
        // Do NOT copy parents
        array_push(upgrades_for_save, copy);
    }
    return upgrades_for_save;
}