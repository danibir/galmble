var pattern = instance_create_layer(0, 0, "Instances", ves_background)
pattern.enabled = true
pattern.xscrollspeed = 2
pattern.modifierList = [
	function (_m) {
		_m.shape.texture = spr_coin
		_m.scale.x /= 16
		_m.scale.y /= 16
		_m.shape.color = make_colour_rgb(_m.getDetSeed(255, 4), _m.getDetSeed(255, 5), _m.getDetSeed(255, 6))
		//_m.shape.color = c_silver
		return _m
	}
]