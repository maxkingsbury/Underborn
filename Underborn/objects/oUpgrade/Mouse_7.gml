

if (state == "idle") {
	
	oUpgrade.state = "go away";
	image_blend = c_orange;
	
	if (sprite_index == sUpgradeTest) { oPlayer.damageArrow += 1 }
	if (sprite_index == sUpgradeTest_1) { oPlayer.damageTwinblade += 1 }
	if (sprite_index == sUpgradeTest_2) { oPlayer.damageJavelin += 1 }
	
}