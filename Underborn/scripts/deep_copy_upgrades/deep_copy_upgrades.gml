function deep_copy_upgrades(upgrades_array) {
    var result = [];
    for (var i = 0; i < array_length(upgrades_array); i++) {
        var old = upgrades_array[i];
        var copy = {};
        copy.name = old.name;
        copy.x = old.x;
        copy.y = old.y;
        copy.cost_coins = old.cost_coins;
        copy.cost_diamonds = old.cost_diamonds;
        copy.unlocked = old.unlocked;
        copy.purchased = old.purchased;
        copy.level = old.level;
        copy.max_level = old.max_level;
        copy.cost_multiplier = old.cost_multiplier;
        copy.effect_value = old.effect_value;
        copy.unlocks = clone_1d_array(old.unlocks);
        copy.radius = old.radius;
        copy.angle = old.angle;
        array_push(result, copy);
    }
    return result;
}