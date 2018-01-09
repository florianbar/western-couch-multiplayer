audio_play_sound(sReload, 1, 0);

bulletsRemaining++;

if bulletsRemaining < bullets
{
	alarm[0] = reloadDelay;
}
else
{
	audio_play_sound(sRevolveCocking, 1, 0);
	isReloading = false;
}