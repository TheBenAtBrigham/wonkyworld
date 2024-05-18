h_spd = dir * spd;
v_spd = v_spd + grav;

if grow{image_index = 0}
else{image_index = 1}


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
	if !grow
	{
		with(obj_player) player_lives = player_lives + 1
	}
	else
	{
		with(obj_player) powered_up = 2;
	}
	instance_destroy();
}
