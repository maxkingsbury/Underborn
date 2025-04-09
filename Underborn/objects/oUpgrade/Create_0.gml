destinationY = 0;
image_alpha = 1; // Might as well do it here, not in collision event

state = "pop in";

// animation curve
getCurve = animcurve_get_channel(Animation_BounceIn, 0);
percent = 0;

// set initial y below the target, e.g. 40 pixels below
y = destinationY + 40;