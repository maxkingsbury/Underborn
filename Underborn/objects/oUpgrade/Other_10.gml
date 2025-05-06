if (state == "idle") {
    // Your existing upgrade code here
    oUpgrade.state = "go away";
    image_blend = c_orange;
        
    var weapon_to_add = "";
        
    // Instead of hardcoding the sprite checks, we'll look up by weapon name
    if (weaponName != "") {
        weapon_to_add = weaponName;
            
        // Apply level up based on weapon name
        switch(weaponName) {
            case "Slash":
                oPlayer.swordLevel += 1;
                break;
            case "Fireball":
                oPlayer.fireballLevel += 1;
                break;
            case "Ice Shard":
                oPlayer.iceShardLevel += 1;
                break;
            case "Bow":
                oPlayer.arrowLevel += 1;
                break;
            case "Javelin":
                oPlayer.javelinLevel += 1;
                break;
            case "Twinblade":
                oPlayer.twinbladeLevel += 1;
                break;
        }
    }
        
    if (weapon_to_add != "") {
        var has_weapon = false;
        for (var i = 0; i < array_length(oPlayer.slot); i++) {
            if (oPlayer.slot[i] == weapon_to_add) {
                has_weapon = true;
                break;
            }
        }
        if (!has_weapon) {
            for (var i = 0; i < array_length(oPlayer.slot); i++) {
                if (is_undefined(oPlayer.slot[i])) {
                    oPlayer.slot[i] = weapon_to_add;
                    break;
                }
            }
        }
    }
}