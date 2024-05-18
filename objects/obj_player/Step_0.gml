//Get inputs
get_controls();

if player_lives == 0
{
	game_end();
}

//X movement
	//Direction
	
	move_dir = right_key - left_key;
	
	//get face
	if move_dir != 0 {face = move_dir;};
	
	//Get xspd
	run_type = run_key;
	xspd = move_dir * move_spd[run_type];

	
	//X collision
	var _sub_pixel = .5;

	if place_meeting(x + xspd, y, obj_wall)
	{
		//check for slope first
			if !place_meeting(x + xspd, y - abs(xspd) - 1, obj_wall)
			{
				while place_meeting(x + xspd, y, obj_wall){y-=_sub_pixel}
			}
		//If not, then just do regular collision or a ceiling slope
		else
		{
			//ceiling slopes
			if !place_meeting(x + xspd, y + abs(xspd) + 1, obj_wall)
			{
				while place_meeting(x + xspd, y, obj_wall){y+=_sub_pixel}
			}
			else
			{
				//scoot up precisely
				var _pixel_check = _sub_pixel * sign(xspd);
				while !place_meeting(x + _pixel_check, y, obj_wall){x += _pixel_check;};
				//set to zero on collison
				xspd = 0;
			}
		}
		
		
	}
	//Go down slopes
	if yspd >= 0 && !place_meeting(x + xspd, y + 1, obj_wall) && place_meeting(x + xspd, y + abs(xspd) + 1, obj_wall)
	{
		while !place_meeting(x + xspd, y + _sub_pixel, obj_wall){y += _sub_pixel;};
	}
	
	if (place_meeting(x+xspd, y, layer_tilemap_get_id("Collide"))){
		var _pixel_check = _sub_pixel * sign(xspd);
		while !place_meeting(x + _pixel_check, y, layer_tilemap_get_id("Collide"))
		{
			x += _pixel_check;
		}
		//set to zero on collison
		xspd = 0;
	}
	//move
	
	if !dead{x += xspd;};
//Y movement
	//gravity
	if coyote_hang_timer > 0
	{
		//count the timer down
		coyote_hang_timer--
	}
	else
	{
		//apply gravity
		yspd += grav;
		//no longer on ground
		set_on_ground(false);
	}
	//reset / prepare jumping variables
	if on_ground
	{
		jump_count = 0;
		coyote_jump_timer = coyote_jump_frames;
	}
	else
	{
		coyote_jump_timer--;
		if jump_count == 0 && coyote_jump_timer <= 0 {jump_count = 1;};
	}
	
	//Initiate the jump
	if jump_key_buffered && jump_count < jump_max
	{
		//reset buffer
		jump_key_buffered = false;
		jump_key_buffer_timer = 0;
		//increase number of peformed jumps
		jump_count++
		//set the jump hold timer.
		jump_hold_timer = jump_hold_frames[jump_count-1]
		//no longer on ground
		set_on_ground(false);
	}
	//cut off jump by holding jump button
	if !jump_key
	{
		jump_hold_timer = 0;
	}
	//jump based on timer/holding of the button
	if jump_hold_timer > 0
	{
		//set yspd to be same as jumping speed
		yspd = jspd[jump_count-1];
		//begin countdown
		jump_hold_timer--;
	}
	//cap falling speed
	if yspd > term_vel { yspd = term_vel;};
	//Jumping
	/*if jump_key_pressed && place_meeting(x, y+1, obj_wall)
	{
		yspd = jspd;
	}*/
	//Y collision
	var _sub_pixel = .5;
	//Upwards y collision
	if yspd < 0 && place_meeting(x, y + yspd, obj_wall)
	{
		//jump into sloped ceilings
		var _slope_slide = false;
		//slide upleft slope
		if move_dir == 0 && !place_meeting(x - abs(yspd) - 1, y + yspd, obj_wall)
		{
			while place_meeting(x, y + yspd, obj_wall){x -= 1;};
			_slope_slide = true;
		}
		//slide upright slope
		if move_dir == 0 && !place_meeting(x + abs(yspd) + 1, y + yspd, obj_wall)
		{
			while place_meeting(x, y + yspd, obj_wall){x += 1;};
			_slope_slide = true;
		}
		//normal Y collision
		if !_slope_slide
		{
			var _pixel_check = _sub_pixel * sign(yspd);
			while !place_meeting(x, y + _pixel_check, obj_wall)
			{
				y += _pixel_check;
			}
			//BONK (OPTIONAL)
			//if yspd < 0 {jump_hold_timer = 0;};
			//set yspd to zero
			yspd = 0;
		}
	}
	if yspd < 0 && place_meeting(x, y + yspd, obj_q_block)
	{
		with obj_q_block
		{
			empty = true;
		}
	}
	//downwards y collision
	if yspd >= 0 {
		if place_meeting(x, y + yspd, obj_wall)
		{
			//scoot up to wall precisely
			var _pixel_check = _sub_pixel * sign(yspd);
			while !place_meeting(x, y + _pixel_check, obj_wall)
			{
				y += _pixel_check;
			}
		
			//set yspd to zero
			yspd = 0;
		}
		//if on ground
		if yspd >= 0 && place_meeting(x, y+1, obj_wall)
		{
			set_on_ground(true)
		}
	}
	y += yspd;
	
//sprite control
if (powered_up == 1)
{
	//walking
	if abs(xspd) > 0 {sprite_index = walk_spr;};
	//running
	if abs(xspd) >= move_spd[1] {sprite_index = run_spr;};
	//standing
	if xspd == 0 {sprite_index = idle_spr;};
	//jumping
	if !on_ground {sprite_index = jump_spr;};
		//set collision mask
		mask_index = mask_spr;
}
else if (powered_up == 2)
{
	//walking
	if abs(xspd) > 0 {sprite_index = big_walk_spr;};
	//running
	if abs(xspd) >= move_spd[1] {sprite_index = big_run_spr;};
	//standing
	if xspd == 0 {sprite_index = big_idle_spr;};
	//jumping
	if !on_ground {sprite_index = big_jump_spr;};
	//run jumping
	if !on_ground && abs(xspd) >= move_spd[1]{sprite_index = big_leap_spr;};
		//set collision mask
		mask_index = big_mask_spr;
}
if place_meeting(x, y, obj_kill)
{
	powered_up = 0;
}

if powered_up <= 0
{
	powered_up = 0;	
}
if powered_up = 0
{
	dead = true;
}
else
{
	dead = false;
}

if (dead == true)
{
	show_debug_message(powered_up);
	visible = false;
	timer--
	if (spawns == 0)
	{
		instance_create_layer(x + 1, y + 1, "Instances", obj_die);
		spawns += 1;
		show_debug_message(powered_up);
	}
	if (timer <= 0)
	{
		spawns = 0
		timer = time
		powered_up = 1;
		show_debug_message(powered_up);
		visible = true;
		x = obj_save_spot.x;
		y = obj_save_spot.y;
		player_lives = player_lives - 1;
		show_debug_message(player_lives);
		
	}
}
