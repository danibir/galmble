xoffset += xscrollspeed
yoffset += yscrollspeed

overflowresetx = ceil((frameXEnd - frameXStart) / xdistance + overflow * 2) * xdistance
overflowresety = ceil((frameYEnd - frameYStart) / ydistance + overflow * 2) * ydistance

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

