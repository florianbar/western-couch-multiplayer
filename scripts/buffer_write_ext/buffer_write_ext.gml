/// @description buffer_write_ext
/// @param buffer
/// @param type
/// @param values...

for(var i = 2; i < argument_count; i++)
{
	buffer_write(argument[0], argument[1], argument[i]);
}