if empty == false
{
	image_index = 0;
}
else
{
	image_index = 1;
}

if place_meeting(x + 5, y + 5 , obj_hammer)
{
	var bricks_flying = part_system_create(bricks);
	part_system_position(bricks_flying, x, y);
	part_system_position(part_system_create(heart_fall), mouse_x, mouse_y);
	with obj_hammer hammer_health = hammer_health - 1;
	with obj_hammer show_debug_message(hammer_health)
	instance_destroy();
}
if place_meeting(x - 5, y - 5 , obj_hammer)
{
	var bricks_flying = part_system_create(bricks);
	part_system_position(bricks_flying, x, y);
	with obj_hammer hammer_health = hammer_health - 1
	with obj_hammer show_debug_message(hammer_health)
	instance_destroy();
}

if place_meeting(x, y + 3, obj_player) 
{
	if obj_player.y > y && obj_player.powered_up == 2 
	{
		var bricks_flying = part_system_create(bricks);
		part_system_position(bricks_flying, x, y);
		instance_destroy();
	}
}