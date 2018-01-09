for (var i = 0; i < gamepadCount; i++)
{
	if gamepad_button_check_pressed(global.gamepads[i], gp_start)
	{
		room_goto(rmGame);
	}
}