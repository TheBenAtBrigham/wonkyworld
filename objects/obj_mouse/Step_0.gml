var dis, dir;
dis = point_distance(x, y, mouse_x, mouse_y) div delay;
dir = point_direction(x, y, mouse_x, mouse_y);

hsp = lengthdir_x(dis, dir);
vsp = lengthdir_y(dis, dir);

repeat (abs(hsp)) {
	if (!place_meeting(x + sign(hsp), y, obj_wall)) {
		x += sign(hsp);
	}
	else {
		hsp = 0;
		break;
	}
}

repeat (abs(vsp)) {
	if (!place_meeting(x, y + sign(vsp), obj_wall)) {
		y += sign(vsp);	
	}
	else {
		vsp = 0;
		break;
	}
}









