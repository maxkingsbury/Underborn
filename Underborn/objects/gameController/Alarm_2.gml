


var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
instance_activate_region(_vx - 100, _vy - 100, _vw + 100, _vh + 100, 1);
instance_deactivate_region(_vx - 150, _vy - 150, _vw + 150, _vh + 150, 0, 1);

if (instance_number(oEnemyParent) < 50){
	repeat(2) {
		var dir = irandom_range(0, 360);
		var XX = oPlayer1.x + lengthdir_x(220,dir)
		var YY = oPlayer1.y + lengthdir_y(220,dir)

		instance_create_layer(XX,YY, "Instances", oEnemyBat)
	}
}


alarm[2] = alarmSpawnTime;
