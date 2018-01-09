/// @description Update the trail
/// @param x
/// @param y
/// @param direction

t_x = argument[0];
t_y = argument[1];
t_dir = argument[2];

// If a new trail segment needs to be created
if (t_create_timer_current == 0)
{
	// Reset timer
	// Why -1? Well if the timer gets set to 1 for example, meaning each step a new segment is added
	// the code in t_step would actually add the segment on the 2nd step because of the else at the end of the code
	t_create_timer_current = t_create_timer -1;
	
	// If max size is reached, push t_start_pointer right (on the buffer) 
	if (t_size_current == t_size)
	{		
		// Write required data to buffer
		buffer_write_ext(t_data_buffer, buffer_f32, t_x, t_y, t_dir);
		
		// Point it to the beginning if it's at the end already
		if (t_start_pointer == t_size - 1) 
		{
			t_start_pointer = 0;
		}
		// Otherwise increase it
		else
		{
			t_start_pointer += 1;
		}
	}
	// Otherwise max length is not yet reached and write new data at the end of current
	else
	{
		// Write new segment
		buffer_seek(t_data_buffer, buffer_seek_start, t_size_current*3*4);
		buffer_write_ext(t_data_buffer, buffer_f32, t_x, t_y, t_dir);
		
		// Return to start
		buffer_seek(t_data_buffer, buffer_seek_start, 0);
		
		// Increase size
		t_size_current += 1;
		t_manipulated -= t_manipulated_change;
	}	
		

}
// Otherwise reduce the timer
else
{
	t_create_timer_current -= 1;
}	

// Needs to be here:
// Update the offset under these conditions
if (t_create_timer_current == 0 && t_size_current == t_size)
{
	t_texture_offset_update = true;
}
