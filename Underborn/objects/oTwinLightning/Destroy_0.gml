// Inherit the parent event
event_inherited();

instance_destroy(oTwinWind);
if (!instance_exists(oBossPortal)) {
	var portal = instance_create_layer(x, y, "Instances", oBossPortal);
	portal.image_xscale = 0.5;
	portal.image_yscale = 0.5;
}
