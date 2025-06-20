
// Initializing children
for (var i = 0; i < array_length(global.upgrades); i++) {
    var upg = global.upgrades[i];
    for (var j = 0; j < array_length(upg.unlocks); j++) {
        var child_index = upg.unlocks[j];
        global.upgrades[child_index].unlocks[array_length(global.upgrades[child_index].unlocks)] = i;
    }
}
