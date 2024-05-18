h_spd = dir * spd;
v_spd = v_spd + grav;

//horizontal collision

//vertical collision

if place_meeting(x + h_spd, y, obj_wall)
{

		while !place_meeting(x + sign(h_spd), y, obj_wall)
		{
			x = x + sign(h_spd);
		}
		dir = dir * -1;
		h_spd = 0;
}
x = x + h_spd;
if place_meeting(x, y + v_spd, obj_wall)
{

		while !place_meeting(x, y + sign(v_spd), obj_wall)
		{
			y = y + sign(v_spd);
		}
		v_spd = 0;
		// for the enemy and ledges.
		if (dont_fall && !position_meeting(x + (sprite_width/2) * dir, y + (sprite_height/2) + 7, obj_wall))
		{
			dir = dir * -1;
		}
}
y = y + v_spd

if place_meeting(x, y, obj_player)
{
	
	with(obj_player) powered_up = 2;
	if instance_exists(obj_hammer)
	{
		with obj_hammer hammer_health = 5;
		var hearts_full = part_system_create(heart_replenish);
		part_system_position(hearts_full, mouse_x, mouse_y);
		instance_destroy();
	}
	else
	{
		var clouds_flying = part_system_create(puff);
		part_system_position(clouds_flying, mouse_x, mouse_y);
		instance_change(obj_hammer, true);
	}
	with obj_hammer show_debug_message(hammer_health)
}
