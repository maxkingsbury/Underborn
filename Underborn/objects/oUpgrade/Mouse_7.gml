

if (state == "idle") {
	
	oUpgrade.state = "go away";
	image_blend = c_orange;
	
	var weapon_to_add = "";

	if (sprite_index == sUpgradeTest) {
	    weapon_to_add = "Slash";
	}
	if (sprite_index == sUpgradeTest_1) {
	    weapon_to_add = "Fireball";
	}
	if (sprite_index == sUpgradeTest_2) {
	    weapon_to_add = "Ice Shard";
	}
	if (sprite_index == sUpgradeTest_3) {
	    weapon_to_add = "Bow";
	}
	if (sprite_index == sUpgradeTest_4) {
	    weapon_to_add = "Javelin";
	}
	if (sprite_index == sUpgradeTest_5) {
	    weapon_to_add = "Twinblade";
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