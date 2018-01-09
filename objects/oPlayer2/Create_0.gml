event_inherited();

//create crosshair
crosshair = instance_create_depth(x,y,depth-10,oCrosshair2);
crosshair.owner = self;


/*
 * Sprites
 */
normalSprite = sPlayer2;
dashSprite	 = sPlayerDash2;
deadSprite	 = sPlayerDead;


/*
 * Control
 */
control = "gamepad";