STATE = PlayerStateMove;

/*
 * Movement
 */
hdir = 0;
vdir = 0;
hsp = 0;
vsp = 0;
moveSpeed = 2;


/*
 * Dash
 */
dashSpeed = 4;
canDash = true;
dashDuration = 0.5 * room_speed;
dashDelay = 0.5 * room_speed;


/*
 * Shoot
 */
//isAiming = false;
canShoot = true;
shootDelay = 0.3 * room_speed;

//create pistol
pistol = instance_create_depth(x,y,depth-1,oPistol);
pistol.owner = self;


/*
 * Sprites
 */
normalSprite = sPlayer1;
dashSprite	 = sPlayerDash1;


/*
 * Game pad setup
 */
if (gamepad_is_connected(0)) gamepad_set_axis_deadzone(0, 0.1);