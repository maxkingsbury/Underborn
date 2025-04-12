/// @description Coin pickup

var _list = ds_list_create();
var _num = collision_circle_list(oPlayer1.x, oPlayer1.y, oPlayer1.collectRadius, oPickupParent, false, true, _list, false);
if (_num > 0)
{
    for (var i = 0; i < _num; ++i;)
    {
        _list[| i].canFly = true;
    }
}
ds_list_destroy(_list);



alarm[3] = alaTime3;