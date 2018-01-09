draw_set_color(c_white);
draw_set_halign(fa_center);

draw_text(room_width/2, room_height/2, "Players found: "+string(gamepadCount));

draw_text(room_width/2, room_height-32, "Press START to play");