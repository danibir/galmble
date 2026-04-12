curtain1 = instance_create_layer(0, 0, "Curtain", ves_background)

curtain1.shapeTemplate.shape.texture = spr_Curtain
curtain1.shapeTemplate.shape.alpha = 1
curtain1.shapeTemplate.size.x = 24
curtain1.shapeTemplate.size.y = 512
window_set_size(display_get_width(), display_get_height())
window_set_position(0, 0)

curtain1.frameXEnd = room_width / 2

curtain1.modifierList = [
function (_m) {
		_m.position.z = _m.seed mod 10
		_m.shape.color = c_red
		return _m
	}
]

curtain2 = instance_create_layer(0, 0, "Curtain", ves_background)
curtain2.shapeTemplate = curtain1.shapeTemplate

curtain2.frameXStart = room_width / 2
curtain2.modifierList = curtain1.modifierList



runForCurtains = function (curtain) {
	curtain.xdistance = 70
	curtain.ydistance = 12800
	curtain.enabled = false
	return curtain
}
runForCurtains(curtain1)
runForCurtains(curtain2)

curtainOpenness = 0
oldMouseY = mouse_y
