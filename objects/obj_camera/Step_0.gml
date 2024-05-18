//want to be full screen and a pepper too?
if keyboard_check_pressed(vk_f8)
{
	window_set_fullscreen(!window_get_fullscreen());
}

//Exit if object doesn't exist...
if !object_exists(obj_player) exit;

//get camera size.
var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0])

//get camera target coordinates.
var _cam_x = obj_player.x - _cam_width/2;
var _cam_y = obj_player.y - _cam_height/2;

//constrain the camera to room borders, pls.
_cam_x = clamp(_cam_x, 0, room_width - _cam_width);
_cam_y = clamp(_cam_y, 0, room_height - _cam_height);

//set camera coordinate variables
_final_cam_x += (_cam_x - _final_cam_x) * _cam_trail_speed;
_final_cam_y += (_cam_y - _final_cam_y) * _cam_trail_speed;

//set camera coordinates.
camera_set_view_pos(view_camera[0], _final_cam_x, _final_cam_y);









