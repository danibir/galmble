
var mi = array_length(buttons)
for (var i = 0; i < mi; i++) {
	
	var xipos
	switch (sign(xallign)){
		case -1:
		xipos = i - mi + 0.5
		break
		case 0:
		xipos = (i - mi / 2 + 0.5)
		break
		case 1:
		xipos = i
		break
	}
	var yipos
	switch (sign(yallign)){
		case -1:
		yipos = i - mi + 0.5
		break
		case 0:
		yipos = i - mi / 2 + 0.5
		break
		case 1:
		yipos = i
		break
	}
	
	var button = buttons[i]
	var xpos = xoffset + xdistance * xipos
	var ypos = yoffset + ydistance * yipos
	var leftwall = xpos - button.variable.width / 2
	var rightwall = xpos + button.variable.width / 2
	var topwall = ypos - button.variable.height / 2
	var bottomwall = ypos + button.variable.height / 2
	var status = button.readonly.status
	if (point_in_rectangle(mouse_x, mouse_y, leftwall, topwall, rightwall, bottomwall)) {
		if mouse_check_button_pressed(mb_left)
			status = "held"
			
		if status = "held" {
			if mouse_check_button(mb_left)
				status = "held"
			if mouse_check_button_released(mb_left) and status = "held" {
				status = "active"
				button.variable.func()
			}
		} else {
			status = "hover"
		}
	} else {
		status = "inactive"
	}
	
	buttons[i].readonly.xpos = xpos
	buttons[i].readonly.ypos = ypos
	buttons[i].readonly.leftwall = leftwall
	buttons[i].readonly.rightwall = rightwall
	buttons[i].readonly.topwall = topwall
	buttons[i].readonly.bottomwall = bottomwall 
	buttons[i].readonly.status = status
}