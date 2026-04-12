xoffset += xscrollspeed
yoffset += yscrollspeed


if xoffset >= frameXEnd {
	xoffset -= overflowresetx
}
if xoffset < frameXStart {
	xoffset += overflowresetx
}

if yoffset >= frameYEnd {
	yoffset -= overflowresety
}	
if yoffset < frameYStart {
	yoffset += overflowresety
}

