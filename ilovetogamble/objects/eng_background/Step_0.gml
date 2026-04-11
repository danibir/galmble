xoffset += xscrollspeed
if xoffset >= frameXEnd {
	xoffset = frameXStart
}
if xoffset < frameXStart {
	xoffset = frameXEnd
}

yoffset += yscrollspeed
if yoffset >= frameYEnd {
	yoffset = frameYStart
}	
if yoffset < frameYStart {
	yoffset = frameYEnd
}

