if empty == false
{
	image_index = 0;
}
else
{
	image_index = 1;
}
if obj_to_spawn == ""
{
	obj_to_spawn = obj_kinoko
}

if place_meeting(x, y + 3, obj_player) && empty == false
{
	if obj_player.y > y
	{
		empty = true;
		instance_create_layer(x + 8, y - 8, "Instances", obj_to_spawn);
	}
}
/*if place_meeting(x - 5, y - 5, obj_hammer)
{
	instance_change(obj_enemy_fall, true);
	with obj_hammer hammer_health = hammer_health - 1;
	with obj_hammer show_debug_message(hammer_health)
}*/
