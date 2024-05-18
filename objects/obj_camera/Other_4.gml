//Exit if object doesn't exist...
if !object_exists(obj_player) exit;

//get camera size.
var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0])

//get camera coordinates at start.
_cam_x = obj_player.x - _cam_width/2;
_cam_y = obj_player.y - _cam_height/2;

//constrain the camera to room borders, pls.
_cam_x = clamp(_cam_x, 0, room_width - _cam_width);
_cam_y = clamp(_cam_y, 0, room_height - _cam_height);

// set camera coordinates at start.
_final_cam_x = _cam_x;
_final_cam_y = _cam_y;


