
for (var i = 0; i < array_length(buttons); i++) {
	var button = buttons[i]

	var color = c_ltgray
	if button.readonly.status = "hover"
		color = c_white
	if button.readonly.status = "held"
		color = c_gray
		
	draw_set_alpha(1)
	draw_set_color(color)
	
	draw_sprite_ext(
	style, 0, 
	button.readonly.xpos, button.readonly.ypos, 
	button.variable.width / sprite_get_width(button.variable.sprite), 
	button.variable.height / sprite_get_height(button.variable.sprite), 
	0, color, 1)
	//draw_rectangle(button.readonly.leftwall,  button.readonly.topwall,  button.readonly.rightwall,  button.readonly.bottomwall, false)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(button.readonly.xpos, button.readonly.ypos, button.variable.name)
}