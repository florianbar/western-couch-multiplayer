global.gamepads = [];
gamepadCount = 0;


//get all connected gamepads

var gamepadSlots = gamepad_get_device_count();

for (var i = 0; i < gamepadSlots; i++)
{
	if (gamepad_is_connected(i)) 
	{
		var index = array_length_1d(global.gamepads);
		global.gamepads[index] = i;
		
		var player = instance_create_depth(0, 0, 0, oPlayer);
		player.gamepad = i;
		player.playerNum = index + 1;
	}
}

gamepadCount = array_length_1d(global.gamepads);