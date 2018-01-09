var aimDirection = point_direction(room_width/2, room_height/2, mouse_x, mouse_y);
	
if point_distance(room_width/2, room_height/2, mouse_x, mouse_y) != distance
{
	x = room_width/2 + lengthdir_x(distance, aimDirection);
	y = room_height/2 + lengthdir_y(distance, aimDirection);
}
else
{
	x = mouse_x;
	y = mouse_y;
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);