/// @description Initialize the engine
/// @param width
/// @param create_timer
/// @param remove_timer
/// @param sprite 

// Note: remove_timer % create_timer must be 0, meaning remove_timer must be a multiple create_timer

t_half_width = argument[0]/2; // Half of trail width
t_create_timer = argument[1]; // How often a new segment is added
t_remove_timer = argument[2]; // When the oldest segment is removed
t_create_timer_current = 0; // Current timer for creating a new segment
t_sprite_width = sprite_get_width(argument[3]); // Sprite width
t_texture = sprite_get_texture(argument[3], 0); 
t_x = 0;
t_y = 0;
t_dir = 0;

/*
Why is an offset required? t_step and t_draw manage the segments of the trail
in order it was created, meaning it writes the "oldest" segment, then the newer one, etc... 
It also draws them in this exact order - from oldest to newest.
To keep track which part of the texture the "oldest" segment started with, we use t_texture_offset
When the "oldest" segment has to be removed (ovewritten to be precise), we update t_texture_offset
so it works for the new "oldest" segment.
If this wasn't implemented, the trail would literally follow the object textures would shift as much as the player moves
*/
t_texture_offset = 0; // Properly read texture offset
t_texture_offset_update = false; // Offset is updated when a segment is removed

// Value of alpha and scale if used
t_manipulated = 1;
t_manipulated_change = t_create_timer / t_remove_timer;

// Buffer size
t_size_current = 0;
t_size = t_remove_timer/t_create_timer;
// Tells which data in a buffer is the oldest segment - t_draw draws from oldest to newest
// Will be referred to as a pointer
t_start_pointer = 0;

t_data_buffer = buffer_create(t_size*3*4, buffer_wrap, 4); 
// *3 - center point x/y, direction
// *4 - each data is 4*1B