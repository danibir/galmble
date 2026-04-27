window_set_size(display_get_width(), display_get_height())
window_set_position(0, 0)

instance_create_layer(0, 0, "Instances", eng_roomstart)
instance_destroy()