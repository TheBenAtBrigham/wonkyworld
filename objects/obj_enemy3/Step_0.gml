h_spd = dir * spd;
v_spd = v_spd + grav;

var _sub_pixel = .5;
//horizontal collision

//vertical collision

if place_meeting(x + h_spd, y, obj_wall)
{
	//check for slopes
	if !place_meeting(x + h_spd, y - abs(h_spd) - 1, obj_wall)
	{
		while place_meeting(x + h_spd, y, obj_wall){y-=_sub_pixel}
	}
	else
	{
		var _pixel_check = _sub_pixel * sign(h_spd)
		//while !place_meeting(x + _pixel_check, y, obj_wall){x += _pixel_check;};
		//while !place_meeting(x + sign(h_spd), y, obj_wall)
		while !place_meeting(x + _pixel_check, y, obj_wall)
		{
			//x = x + sign(h_spd);
			x = x + _pixel_check;
		}
		dir = dir * -1;
		h_spd = 0;
	}
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
	if obj_player.y < y
	{
		with(obj_player) yspd = yspd - 5;
		var clouds_flying = part_system_create(puff);
		part_system_position(clouds_flying, x, y);
		instance_change(obj_enemy1, true);
		
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
	with obj_hammer hammer_health = hammer_health - 1;
	with obj_hammer show_debug_message(hammer_health)
	instance_change(obj_enemy3_fall, true);
}
