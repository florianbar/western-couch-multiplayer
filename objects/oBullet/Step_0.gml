/*
 * Bullet trail
 */
var trailDirection = point_direction(x,y,x+hsp,y+vsp);
t_step_sprite(x, y, trailDirection);

/*
 * Horizontal collision
 */
if place_meeting(x+hsp, y, oWall)
{
	while !place_meeting(x+sign(hsp), y, oWall)
	{
		x += sign(hsp);
	}
	
	if !hasBounced
	{
		hsp *= -1;
		hasBounced = true;
		
		alarm[0] = 0.1 * room_speed;
	}
	else
	{
		instance_change(oBulletImpact, true);
	}
}

x += hsp;


/*
 * Vertical collision
 */
if place_meeting(x, y+vsp, oWall)
{
	while !place_meeting(x, y+sign(vsp), oWall)
	{
		y += sign(vsp);
	}
	
	if !hasBounced
	{
		vsp *= -1;
		hasBounced = true;
		
		alarm[0] = 0.1 * room_speed;
	}
	else
	{
		instance_change(oBulletImpact, true);
	}
}

y += vsp; 