// Allow reading texture outside [0,1]
gpu_set_texrepeat(true);

// Enables AA
display_reset(2, true);
gpu_set_texfilter(false);

randomize();

sprite_array[0] = trail_1_spr;
sprite_array[1] = trail_2_spr;
sprite_array[2] = trail_3_spr;
sprite_array[3] = trail_4_spr;

path_array[0] = path;
path_array[1] = path1;
path_array[2] = path2;
path_array[3] = path3;