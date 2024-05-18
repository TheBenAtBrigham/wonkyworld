var _follow = obj_player;
play_dir = point_direction(obj_player.x, obj_player.y, obj_mouse.x, obj_mouse.y);
var dis, dir;
var distance = clamp(point_distance(mouse_x, mouse_y, _follow.x, _follow.y), 0, 50);
dis = point_distance(x, y, mouse_x, mouse_y) div delay;
dir = point_direction(x, y, mouse_x, mouse_y);


hsp = lengthdir_x(dis, dir);
vsp = lengthdir_y(dis, dir);


//hsp = _follow.x + lengthdir_x(distance, point_direction(_follow.x, _follow.y, mouse_x, mouse_y));
//vsp = _follow.y + lengthdir_y(distance, point_direction(_follow.x, _follow.y, mouse_x, mouse_y));


//x = follow.x + lengthdir_x(distance, point_direction(follow.x, follow.y, mouse_x, mouse_y));
//y = follow.y + lengthdir_y(distance, point_direction(follow.x, follow.y, mouse_x, mouse_y));



repeat (abs(hsp)) {
	if (!place_meeting(x + sign(hsp), y, obj_wall)) {
		x += sign(hsp);
		
	}
	else {
		hsp = 0;
		//obj_player.x+=-1
		break;
	}
}

repeat (abs(vsp)) {
	if (!place_meeting(x, y + sign(vsp), obj_wall)) {
		y += sign(vsp);	
	}
	else {
		vsp = 0;
		//obj_player.y+=-1
		break;
	}
}

var _distance_from_player = 50 //change this to whatever you want
x_offset = lengthdir_x(_distance_from_player, play_dir)
y_offset = lengthdir_y(_distance_from_player, play_dir)

image_angle = play_dir
if x_offset > 0 {
    image_yscale = 1
} else {
    image_yscale = -1
}

if hammer_health == 0
{
	var clouds_flying = part_system_create(puff);
	part_system_position(clouds_flying, mouse_x, mouse_y);
	instance_change(obj_falling_hammer, true);
}









