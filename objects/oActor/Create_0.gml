/*
 * The ID used to link back to the player object
 */
player = noone;
gamepad = noone;
state = "move";
playerNumber = 0;

/*
 * Movement
 */
direction = 0;
hdir = 0;
vdir = 0;
hsp = 0;
vsp = 0;
moveSpeed = 2;
dashSpeed = 3;

/*
 * Crosshair
 */
crosshair = instance_create_depth(x, y, depth-10, oCrosshair);
crosshair.actor = self;

canShoot = true;
canDash = true;

shootDelay = Seconds(.2);