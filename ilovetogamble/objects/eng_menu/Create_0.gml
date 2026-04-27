buttons = []

xoffset = 0
yoffset = 0
xallign = 0 // 1 = left is startpoint, 0 = middle is startpoimt, -1 = right is startpoint
yallign = 1 // 1 = top is startpoint, 0 = center is startpoimt, -1 = bottom is startpoint
xdistance = 0 //distance between each button, x
ydistance = 32 //distance between each button, y

style = spr_button

createButton = function (name, func, width, height, sprite = style, append = true) {
	var objButton = {
		variable: {
			name: name,
			func: func,
			width: width, 
			height: height,
			sprite: sprite
		},
		readonly: {
			xpos: 0,
			ypos: 0,
			leftwall: 0,
			rightwall: 0,
			topwall: 0,
			bottomwall: 0,
			status: "inactive"
		}
	}
	if append = true {
		array_push(buttons, objButton)
	}
	return objButton
}