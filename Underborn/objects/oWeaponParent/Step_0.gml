

var _list = ds_list_create();
var _num = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, oEnemyParent, false, true, _list, false);
if (_num > 0)
{
    for (var i = 0; i < _num; ++i;) {
		if (_list[| i].sprite_index == _list[| i].spr){
			
			_list[| i].sprite_index = _list[| i].sprW;
			
			var dir = point_direction(x,y,_list[| i].x, _list[| i].y);
			_list[| i].x = _list[| i].x + lengthdir_x(3, dir);
			_list[| i].y = _list[| i].y + lengthdir_y(3, dir);
			
			var final_damage = dmg;
			
			if (random(1) < global.crit_chance) {
			    final_damage *= 2; // double damage on crit
			    part_particles_create(global.crit_ps, _list[| i].x, _list[| i].y, part_crit, 30);
			}
			(_list[| i]).hp -= final_damage;
			//if ((_list[| i]).hp) <= 0 {
			//	instance_destroy(_list[| i]);
			//}
		}
    }
}
ds_list_destroy(_list);