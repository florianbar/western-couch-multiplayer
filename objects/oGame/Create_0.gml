for (var i = 0; i < instance_number(oPlayer); i++)
{
	var player = instance_find(oPlayer, i);

	/*
	 * Get actor's position in room
	 */
	switch (i) {
		case 0:
			var posX = 48, posY = 80;
			break;
			
		case 1:
			var posX = 592, posY = 80;
			break;
			
		case 2:
			var posX = 48, posY = 432;
			break;
			
		case 3:
			var posX = 592, posY = 432;
			break;
	}
	
	/*
	 * Create actor
	 */
	var actor = instance_create_depth(posX, posY, depth, oActor);
	actor.gamepad = player.gamepad;
	
	/*
	 * Use id's to handle dependencies between player and actor
	 */
	player.actor = actor;
	actor.player = player;
}