var inst = instance_create_layer(random(room_width-300), random(room_height-150), "Instances", sprite_overlap_obj);
with (inst)
{
	t_init_sprite_overlap(1, 15, sprite_index);
	path_start(other.path_array[irandom(3)], 10, path_action_restart, false);
}