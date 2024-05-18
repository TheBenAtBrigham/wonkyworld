
image_angle += spin_speed
y += fall_speed

if image_angle >= 360
{
	image_angle = 0;
}
timer--;

if (timer <= 0)
{
	timer = time	
	instance_destroy();
}






