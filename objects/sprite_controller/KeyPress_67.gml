// Clear all created instances
with(sprite_obj)
{
	instance_destroy(self, false);
}

with(sprite_overlap_obj)
{
	instance_destroy(self, false);
}