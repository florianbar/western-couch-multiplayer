x = mouse_x;
y = mouse_y;

// Swing right
if (position == 0)
{
	image_angle = lerp(image_angle, -45, 0.05);
}
// Swing left
else
{
	image_angle = lerp(image_angle, 225, 0.05);
}

t_step_sprite(x + lengthdir_x(128, image_angle), y + lengthdir_y(128, image_angle), image_angle-90);