xoffset += xscrollspeed
if xoffset >= 0 {
	xoffset -= xdistance
}
if xoffset < -xdistance {
	xoffset += xdistance
}

yoffset += yscrollspeed
if yoffset >= 0 {
	yoffset -= ydistance
}	
if yoffset < -yoffset {
	yoffset += ydistance
}
	
backgroundItemRotation -= 2