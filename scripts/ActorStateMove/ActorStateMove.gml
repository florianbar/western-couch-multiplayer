/// @description ActorStateMove

//set sprite
if instance_exists(player)
{
	switch player.playerNum
	{
		case 1:
			sprite_index = sActorP1;
			break;
			
		case 2:
			sprite_index = sActorP2;
			break;
			
		case 3:
			sprite_index = sActorP3;
			break;
			
		case 4:
			sprite_index = sActorP3;
			break;
	}
}


//User input
var keyMoveH = round(gamepad_axis_value(gamepad, gp_axislh));
var keyMoveV = round(gamepad_axis_value(gamepad, gp_axislv));
var keyDash  = gamepad_button_check_pressed(gamepad, gp_shoulderlb);
var keyShoot = gamepad_button_check_pressed(gamepad, gp_shoulderrb); 
	
	
//Move direction
hdir = keyMoveH;
vdir = keyMoveV;
hsp = hdir * moveSpeed;
vsp = vdir * moveSpeed;


//Dash
if (keyDash and canDash) state = "dash";
	
	
//Crosshair aim
var aimDirection = GamepadAxisAngle(gamepad, gp_axisrh);
image_angle = aimDirection;
if (crosshair) crosshair.aimDirection = aimDirection;
		
		
//shoot
if keyShoot and canShoot
{
	//disable shooting
	canShoot = false;
	alarm[0] = shootDelay;
	
	//create bullet
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