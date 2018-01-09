/// @description ActorStateDash

//set sprite
if instance_exists(player)
{
	switch player.playerNum
	{
		case 1:
			sprite_index = sActorP1Dash;
			break;
			
		case 2:
			sprite_index = sActorP2Dash;
			break;
			
		case 3:
			sprite_index = sActorP3Dash;
			break;
			
		case 4:
			sprite_index = sActorP3Dash;
			break;
	}
}


//init dash state
if canDash
{
	canDash = false;
	alarm[1] = Seconds(0.3);
	alarm[2] = Seconds(1);
	image_angle = point_direction(0, 0, hdir, vdir);
}


//User input
var keyShoot = gamepad_button_check_pressed(gamepad, gp_shoulderrb); 


//Move direction
hsp = hdir * dashSpeed;
vsp = vdir * dashSpeed;

//half the length of diagonal dashing
if hdir != 0 and vdir != 0
{
	hsp = hdir * (dashSpeed - 1);
	vsp = vdir * (dashSpeed - 1);
}


//Crosshair aim
var aimDirection = GamepadAxisAngle(gamepad, gp_axisrh);
if (crosshair) crosshair.aimDirection = aimDirection;


//Shoot
if keyShoot and canShoot
{
	//disable shooting
	canShoot = false;
	alarm[0] = shootDelay;
	
	var bullet = instance_create_depth(x, y, depth-10, oBullet);
	bullet.actor = self;
	bullet.hsp = lengthdir_x(bullet.moveSpeed, aimDirection);
	bullet.vsp = lengthdir_y(bullet.moveSpeed, aimDirection);
}


//Horizontal collisions
if !place_free(x+hsp, y) {
	while place_free(x+sign(hsp), y) {
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;


//Vertical collisions
if !place_free(x, y+vsp) {
	while place_free(x, y+sign(vsp)) {
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;