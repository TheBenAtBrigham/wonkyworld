//lives
player_lives = 5;
//control set up
controls_set_up();
//custom functions for player

function set_on_ground(_var = true)
{
	if _var == true
	{
		on_ground = true;
		coyote_hang_timer = coyote_hang_frames;
	}
	else
	{
		on_ground = false;
	}
}

powered_up = 1;

//Sprites
	//small sprite
	mask_spr = spr_mario_idle
	idle_spr = spr_mario_idle
	walk_spr = spr_mario_walk
	run_spr = spr_player_placeholder
	jump_spr = spr_mario_jump
	//big sprite
	big_mask_spr = spr_supermario_idle
	big_idle_spr = spr_supermario_idle
	big_walk_spr = spr_supermario_walk
	big_run_spr = spr_supermario_sprint
	big_jump_spr = spr_supermario_jump
	big_leap_spr = spr_supermario_leap
	
//fall_spr = 

// Moving
face = 1
move_dir = 0;
run_type = 0;
move_spd[0] = 2;
move_spd[1] = 3.5;
xspd = 0;
yspd = 0;

// Jumping
grav = .275;
term_vel = 4;
on_ground = true;
jump_max = 1;
jump_count = 0;
jump_hold_timer = 0;
	//Jump values for each successful jump
	jump_hold_frames[0] = 18
	jspd[0] = -3.15;
	jump_hold_frames[1] = 10
	jspd[1] = -2.85;


//Coyote Time
	//Hang Time
	coyote_hang_frames = 2;
	coyote_hang_timer = 0;
	//Jump Buffer Time
	coyote_jump_frames = 5;
	coyote_jump_timer = 0;

//Timer for death animation
dead = false;
time = 40;
timer = time;

spawns = 0;
spawns_max = 1;

