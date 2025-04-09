

if (state == "idle") {
	
	oUpgrade.state = "go away";
	image_blend = c_orange;
	
	if (sprite_index == sUpgradeTest) { oPlayer1.damageArrow += 1 }
	if (sprite_index == sUpgradeTest_1) { oPlayer1.damageTwinblade += 1 }
	if (sprite_index == sUpgradeTest_2) { oPlayer1.damageJavelin += 1 }
	
}