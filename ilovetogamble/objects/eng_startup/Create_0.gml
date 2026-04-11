curtain1 = instance_create_layer(0, 0, "Instances", eng_background)

curtain1.shapeTemplate[? "shape"].texture = spr_Curtain
curtain1.shapeTemplate[? "shape"].alpha = 1
curtain1.shapeTemplate[? "size"].x = 20
curtain1.shapeTemplate[? "size"].y = 512
curtain1.frameXEnd = room_width / 2
curtain1.enabled = true
/*
curtain1.modifierList = [
	
]

curtain2 = instance_create_layer(0, 0, "Instances", eng_background)
curtain2.shapeTemplate = curtain1.shapeTemplate

curtain2.frameXStart = room_width / 2
curtain2.modifierList = curtain1.modifierList

runForCurtains = function (curtain) {
	curtain.xdistance = 64
	curtain.ydistance = 12800
	curtain.enabled = true
	return curtain
}
runForCurtains(curtain1)
runForCurtains(curtain2)

curtainOpenness = 0
oldMouseY = mouse_y
