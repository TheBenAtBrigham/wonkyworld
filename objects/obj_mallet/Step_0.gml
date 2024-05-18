
dir = point_direction(obj_player.x, obj_player.y, obj_mouse.x, obj_mouse.y)
var layer_id = layer_get_id("Walls");
follow = obj_player;
barrier = obj_wall;

//barrier = layer_tilemap_get_id("Walls");
var distance = clamp(point_distance(mouse_x, mouse_y, follow.x, follow.y), 0, 50);
var blockaide = clamp(point_distance(mouse_x, mouse_y, barrier.x, barrier.y), 0, 0);


var _sub_pixel = .5;
if !place_meeting(mouse_x, mouse_y, barrier)
{
	
	x = follow.x + lengthdir_x(distance, point_direction(follow.x, follow.y, mouse_x, mouse_y));
	y = follow.y + lengthdir_y(distance, point_direction(follow.x, follow.y, mouse_x, mouse_y));
}


var _distance_from_player = 50 //change this to whatever you want
x_offset = lengthdir_x(_distance_from_player, dir)
y_offset = lengthdir_y(_distance_from_player, dir)

image_angle = dir
if x_offset > 0 {
    image_yscale = 1
} else {
    image_yscale = -1
}

var _sub_pixel = .5;




