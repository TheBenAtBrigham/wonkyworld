h_spd = dir * spd;
v_spd = v_spd + grav;

var _sub_pixel = .5;
//horizontal collision

//vertical collision


if place_meeting(x, y, obj_player)
{
	if obj_player.y < y
	{
		timer--
		if (hit_player == false)
		{
			
			with(obj_player) powered_up = powered_up - 1;
			hit_player = true;
		}
		if (timer <= 0)
		{
			hit_player = false;
			timer = time
		}
	}
	else
	{
		//with(obj_player) powered_up = false
		timer--
		if (hit_player == false)
		{
			
			with(obj_player) powered_up = powered_up - 1;
			hit_player = true;
		}
		if (timer <= 0)
		{
			hit_player = false;
			timer = time
		}
		//with(obj_player) powered_up =- 1;
		//game_restart();
	}
}
if place_meeting(x, y, obj_hammer)
{
	instance_change(obj_enemy_fall, true);
	var clouds_flying = part_system_create(puff);
	part_system_position(clouds_flying, x, y);
	with obj_hammer hammer_health = hammer_health - 1;
	with obj_hammer show_debug_message(hammer_health)
}
