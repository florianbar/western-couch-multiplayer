audio_play_sound(sShoot, 1, 0);

actor = noone;
moveSpeed = 16;
hsp = 0;
vsp = 0;
hasBounced = true;

//destroy bullet
alarm[0] = 2 * room_speed;

t_init_sprite(4, 1, 15, sBulletTrail);