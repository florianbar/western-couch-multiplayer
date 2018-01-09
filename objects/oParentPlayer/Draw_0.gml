draw_self();

if instance_exists(pistol)
{
	for (var i = 0; i < pistol.bulletsRemaining; i++)
	{
		var submig = (pistol.isReloading)? 1 : 0; 
		var ammoWidth = pistol.bulletsRemaining * 4;
		var posX = x - round(ammoWidth / 2) + (4 * i);
		draw_sprite(sBulletIndicator, submig, posX, y-25);
	}
}