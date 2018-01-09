/// @description Draw the trail

// Extra variables 
var _x = 0; // x of the first 2 vertices of a segment
var _y = 0; // y of the first 2 vertices of a segment
var _dir = 0; // direction of the first 2 vertices of a segment
var _x2 = 0; // x of the second 2 vertices of a segment
var _y2 = 0; // y of the second 2 vertices of a segment
var _dist = 0; // distance between first and second coordinates
var _offset = t_texture_offset;

// Read the first data - it exists because t_step_sprite generates when it's FIRST called
_x = buffer_read(t_data_buffer, buffer_f32);
_y = buffer_read(t_data_buffer, buffer_f32);
_dir = buffer_read(t_data_buffer, buffer_f32);

// Begin drawing
draw_primitive_begin_texture(pr_trianglestrip, t_texture);
	
// First 2 vertices
draw_vertex_texture_colour(_x+lengthdir_x(t_half_width, _dir+90), _y+lengthdir_y(t_half_width, _dir+90), t_texture_offset, 0, c_white, 1);
draw_vertex_texture_colour(_x+lengthdir_x(t_half_width, _dir-90), _y+lengthdir_y(t_half_width, _dir-90), t_texture_offset, 1, c_white, 1);
	
// if t_size_current is 1, a segment doesn't fully exist yet - the 2nd half is connected to the object
repeat(t_size_current-1) //for(var i = 1; i < t_size_current; i++)
{
	// Read any data that (if exists) follows the first 
	_x2 = buffer_read(t_data_buffer, buffer_f32);
	_y2 = buffer_read(t_data_buffer, buffer_f32);
	_dir = buffer_read(t_data_buffer, buffer_f32);

	// Calculate size of texture to draw
	_dist = (point_distance(_x, _y, _x2, _y2) / t_sprite_width);

	// Draw the segment
	draw_vertex_texture_colour(_x2+lengthdir_x(t_half_width, _dir+90), _y2+lengthdir_y(t_half_width, _dir+90), t_texture_offset + _dist, 0, c_white, 1);
	draw_vertex_texture_colour(_x2+lengthdir_x(t_half_width, _dir-90), _y2+lengthdir_y(t_half_width, _dir-90), t_texture_offset + _dist, 1, c_white, 1);

	// Replace previous segment data with current
	_x = _x2;
	_y = _y2;
	
	// Update the offset for the next segment
	t_texture_offset = (t_texture_offset + _dist);
	
	// If previous segment will be removed the next step (t_step_sprite), retrieve the offset
	if (t_texture_offset_update == true)
	{
		_offset = t_texture_offset % 1;
		t_texture_offset_update = false;
	}	
}

// Draw the last segment that's directly behind the object
_dist = (point_distance(_x, _y, t_x, t_y) / t_sprite_width);

draw_vertex_texture_colour(t_x+lengthdir_x(t_half_width, t_dir+90), t_y+lengthdir_y(t_half_width, t_dir+90), t_texture_offset + _dist, 0, c_white, 1);
draw_vertex_texture_colour(t_x+lengthdir_x(t_half_width, t_dir-90), t_y+lengthdir_y(t_half_width, t_dir-90), t_texture_offset + _dist, 1, c_white, 1);

// Finish drawing
draw_primitive_end();

// Reset offset for next draw event
t_texture_offset = _offset;

// Reset pointer
buffer_seek(t_data_buffer, 0, t_start_pointer*3*4);
