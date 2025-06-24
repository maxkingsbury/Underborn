
global.parents_map = array_create(array_length(global.upgrades), []); // initialize empty arrays

for (var parent = 0; parent < array_length(global.upgrades); parent++) {
    var parent_upgrade = global.upgrades[parent];
    for (var j = 0; j < array_length(parent_upgrade.unlocks); j++) {
        var child_index = parent_upgrade.unlocks[j];

        // Avoid duplicates
        if (!array_contains(global.parents_map[child_index], parent)) {
            array_push(global.parents_map[child_index], parent);
        }
    }
}