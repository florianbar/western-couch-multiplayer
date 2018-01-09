/// @description GamepadAxisAngle(device, axis);
// GamepadAxisAngle(0, gp_axisrh);

var device = argument0;
var axis   = argument1;

//GamepadAxisAngle();
if gamepad_is_connected(device) 
{
	var hdir = gamepad_axis_value(device, gp_axisrh);
	var vdir = gamepad_axis_value(device, gp_axisrv);
	
	if (hdir != 0) or (vdir != 0)
	{
		return point_direction(0, 0, hdir, vdir)
	}
}

return 0;