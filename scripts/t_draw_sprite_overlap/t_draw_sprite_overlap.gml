/// @description Draw the trail

// Extra variables 
var _x = 0; // x of the first 2 vertices of a segment
var _y = 0; // y of the first 2 vertices of a segment
var _dir = 0; // direction of the first 2 vertices of a segment

repeat(t_size_current)
{
	// Read any data that (if exists) follows the first 
	_x = buffer_read(t_data_buffer, buffer_f32);
	_y = buffer_read(t_data_buffer, buffer_f32);
	_dir = buffer_read(t_data_buffer, buffer_f32);

	draw_sprite_ext(t_sprite, 0, _x, _y, 1, 1, _dir, c_white, 1);
}

// Reset pointer
buffer_seek(t_data_buffer, 0, t_start_pointer*3*4);
