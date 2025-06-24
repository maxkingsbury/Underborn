function upgrade_controller_rebuild_parents() {
    // Clear parents first
    for (var i = 0; i < array_length(global.upgrades); i++) {
        global.upgrades[i].parents = [];
    }
    
    // Populate parents based on unlocks
    for (var i = 0; i < array_length(global.upgrades); i++) {
        var upg = global.upgrades[i];
        for (var j = 0; j < array_length(upg.unlocks); j++) {
            var child_index = upg.unlocks[j];
            array_push(global.upgrades[child_index].parents, i);
        }
    }
}