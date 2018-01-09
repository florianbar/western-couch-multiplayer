/// @description Initialize the engine
/// @param create_timer
/// @param remove_timer
/// @param sprite

// Note: remove_timer % create_timer must be 0, meaning remove_timer must be a multiple create_timer

t_create_timer = argument[0]; // How often a new segment is added
t_remove_timer = argument[1]; // When the oldest segment is removed
t_create_timer_current = 0; // Current timer for creating a new segment
t_sprite = argument[2];
t_x = 0;
t_y = 0;
t_dir = 0;

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