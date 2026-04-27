xoffset += xoffsetspeed

pattern.modifierList = [
	function (_m) {
		_m.shape.texture = spr_coin
		_m.scale.x /= 16
		_m.scale.y /= 16
		_m.scale.x *= cos((_m.position.x + xoffset) / 64)
		_m.shape.color = make_colour_rgb(_m.getDetSeed(255, 4), _m.getDetSeed(255, 5), _m.getDetSeed(255, 6))
		_m.position.y += _m.position.x / 2
		_m.position.x += _m.position.y / 2
		_m.shape.alpha = 0.1
		//_m.shape.color = c_yellow
		return _m
	}
]