
image_alpha = 1; // Might as well do it here, not in collision event

// animation curve
getCurve = animcurve_get_channel(Animation_BounceIn, 0);
getCurve2 = animcurve_get_channel(Animation_BounceOut, 0);
percent = 0;

clickable = true;
was_clicked = false;

// Initialize variables
state = "idle";
weaponName = "";
weaponDescription = "";
effectText = "";
currentLevel = 0;
depth = -2000; // Ensure it draws above most objects
alarm[0] = 1; // Set an alarm to check position after creation