if other != actor and other.STATE != PlayerStateDead
{
	if (actor == oPlayer1.id) global.player1Score++;
	else global.player2Score++;
	
	other.STATE = PlayerStateDead;
	instance_change(oBulletImpact, true);
}