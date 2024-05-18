function controls_set_up()
{
	jump_buffer_time = 3;
	jump_key_buffered = 0;
	jump_key_buffer_timer = 0;
}
function get_controls()
{
	//direction inputs
	right_key = keyboard_check( vk_right ); //+ gamepad_button_check_pressed(0, gp_padr);
		right_key = clamp(right_key, 0, 1);
	left_key = keyboard_check( vk_left ); //+ gamepad_button_check_pressed(0, gp_pad1);
		left_key = clamp(left_key, 0, 1);
	
	//action inputs
	jump_key_pressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(0, gp_face1);
		jump_key_pressed = clamp(jump_key_pressed, 0, 1);
	jump_key = keyboard_check(vk_space) + gamepad_button_check(0, gp_face1);
		jump_key = clamp(jump_key, 0, 1);
	run_key = keyboard_check(ord("Q") + gamepad_button_check(0, gp_face2));
		run_key = clamp(run_key, 0, 1);
		
	//jump key buffering
	if jump_key_pressed
	{
		jump_key_buffer_timer = jump_buffer_time;
	}
	if jump_key_buffer_timer > 0
	{
		jump_key_buffered = 1;
		jump_key_buffer_timer--;
	}
	else
	{
		jump_key_buffered = 0;
	}
}
function manage_death_booleans(bool1, bool2)
{
	if bool1 == true
	{
		bool1 = false
		bool2 = false
	}
	if bool1 == false
	{
		bool2 = true
	}
}