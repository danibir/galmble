count = 0
	for (var _y = -2; _y < room_height / ydistance  + 2; _y++)
	for (var _x = -2; _x < room_width / xdistance + 2; _x++)
	{
		count++
		var _m = shapeMatrix(
			"rectangle",
			c_orange,
			backgroundItemAlpha,
			count,
		    xoffset + _x * xdistance,
		    yoffset + _y * ydistance,
		    0,
		    0,
		    0,
		    backgroundItemRotation,
		    backgroundItemXscale,
		    backgroundItemYscale,
		    1
		)
		var _mnext = _m
		_mnext[? "x"] += xdistance
		_mnext[? "y"] += ydistance
		_mnext[? "id"]++
		var _mprev = _m
		_mprev[? "x"] -= xdistance
		_mprev[? "y"] -= ydistance
		_mprev[? "id"]--
	
		for (var i = 0; i < array_length(modifierList); i++){
			_m = modifierList[i].apply(_m)
			_mnext = modifierList[i].apply(_m)
			_mprev = modifierList[i].apply(_m)
		}
		
		//4 following sequences are inaccurate, fix or forbid
		var matrix = matrix_build(
		_m[? "x"], _m[? "y"], _m[? "z"], 
		_m[? "xrotation"], _m[? "yrotation"], _m[? "zrotation"], 
		_m[? "xscale"] / 2, _m[? "yscale"] / 2, _m[? "zscale"] / 2
		)
		matrix_set(matrix_world, matrix)
		draw_set_color(_m[? "color"])
		draw_set_alpha(_m[? "alpha"])
		draw_rectangle(-0.5, -0.5, 0.5, 0.5, false)//other options
		
		
		ds_map_destroy(_m)
	}

matrix_set(matrix_world, matrix_build_identity())
