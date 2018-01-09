var inst = instance_create_layer(random(room_width-300), random(room_height-150), "Instances", sprite_obj);
with (inst)
{
	t_init_sprite(32, 2, 64, other.sprite_array[irandom(3)]);
	path_start(other.path_array[irandom(3)], 5, path_action_restart, false);
}