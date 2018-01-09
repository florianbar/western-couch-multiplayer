if (owner == noone) exit;


//realtive position to owner
x = owner.x + lengthdir_x(distance, aimDirection);
y = owner.y + lengthdir_y(distance, aimDirection);
	
//angle relative to owner
image_angle = aimDirection;
	
if (aimDirection >= 0 and aimDirection < 90) or (aimDirection >= 270 and aimDirection < 360) {
	image_yscale = 1;
} else {
	image_yscale = -1;
} 

//reload pistol
if bulletsRemaining == 0 and !isReloading
{
	isReloading = true;
	alarm[0] = reloadDelay;
}