draw_set_font(fScore);

for (var i = 0; i < instance_number(oPlayer); i++)
{
	var player = instance_find(oPlayer, i);

	/*
	 * Get actor's position in room
	 */
	switch (i) {
		case 0:
			draw_set_color(c_red);
			draw_set_halign(fa_left);
			draw_text(15, 15, "Kills: "+string(player.kills));
			break;
			
		case 1:
			draw_set_color(c_blue);
			draw_set_halign(fa_right);
			draw_text(room_width-15, 15, "Kills: "+string(player.kills));
			break;
			
		case 2:
			draw_set_color(c_green);
			draw_set_halign(fa_left);
			draw_text(15, room_height-15, "Kills: "+string(player.kills));
			break;
			
		case 3:
			draw_set_color(c_orange);
			draw_set_halign(fa_right);
			draw_text(room_width-15, room_height-15, "Kills: "+string(player.kills));
			break;
	}
}