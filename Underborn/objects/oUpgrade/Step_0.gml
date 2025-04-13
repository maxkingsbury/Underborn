
if (state = "pop in") {
	percent += 1/90;
	var pos = animcurve_channel_evaluate(getCurve, percent);
	
	y = destinationY - pos;
	
	if (percent > 1) { percent = 1; state = "idle"; }
}

if (state = "go away") {
	percent -= 1/50;
	var pos = animcurve_channel_evaluate(getCurve2, percent);
	
	y = destinationY - pos;
	
	if (percent <= 0.01) { instance_destroy(); }
}