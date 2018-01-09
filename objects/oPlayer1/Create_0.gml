event_inherited();

//create crosshair
crosshair = instance_create_depth(x,y,depth-10,oCrosshair1);
crosshair.owner = self;


/*
 * Sprites
 */
normalSprite = sPlayer1;
dashSprite	 = sPlayerDash1;
deadSprite	 = sPlayerDead;


/*
 * Control
 */
control = "keyboard";