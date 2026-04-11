
if enabled = true
{

	//draw_rectangle(frameXStart + frameXOffset + frameYOffset, frameYStart, frameXEnd + frameXOffset, frameYEnd + frameYOffset, true)
	gpu_set_scissor(
	frameXStart + frameXOffset, 
	frameYStart + frameYOffset, 
	frameXEnd - frameXStart, 
	frameYEnd - frameYStart)
	gpu_set_ztestenable(true)
	gpu_set_zwriteenable(true)

	count = 0
	for (var _y = frameYStart / ydistance - overflow; _y < frameYEnd / ydistance + overflow; _y++)
	for (var _x = frameXStart / xdistance - overflow; _x < frameXEnd / xdistance + overflow; _x++)
	{
		count++
		var _m = ds_map_create()
		ds_map_copy(_m, shapeTemplate)
		
		_m[? "id"] = count
		_m[? "getSeed"](_m, count)
		_m[? "position"].x = xdistance * _x + xoffset
		_m[? "position"].y = ydistance * _y + yoffset
		
		var _mflat = ds_map_create()
		ds_map_copy(_mflat, _m)
		
		_m[? "apply"](_m, modifierList)
		
		var xscrollwidth = ceil((frameXEnd - frameXStart) / xdistance + overflow * 2) * xdistance
		var yscrollwidth = ceil((frameYEnd - frameYStart) / ydistance + overflow * 2) * ydistance
		if _m[? "position"].x < frameXStart - xdistance * overflow 
			while _m[? "position"].x < frameXStart - xdistance * overflow {
				ds_map_empty(_m)
				ds_map_copy(_m, _mflat)
				_m[? "position"].x += xscrollwidth
				_m[? "apply"](_m, modifierList)
			}
		else if _m[? "position"].x > frameXEnd + xdistance * overflow
			while _m[? "position"].x > frameXEnd + xdistance * overflow {
				ds_map_empty(_m)
				ds_map_copy(_m, _mflat)
				_m[? "position"].x -= xscrollwidth
				_m[? "apply"](_m, modifierList)
			}
		
		if _m[? "position"].y < frameYStart - ydistance * overflow
			while _m[? "position"].y < frameYStart - ydistance * overflow {
				ds_map_empty(_m)
				ds_map_copy(_m, _mflat)
				_m[? "position"].y += yscrollwidth
				_m[? "apply"](_m, modifierList)
			}
		else if _m[? "position"].y > frameYEnd + ydistance * overflow 
			while _m[? "position"].y > frameYEnd + ydistance * overflow {
				ds_map_empty(_m)
				ds_map_copy(_m, _mflat)
				_m[? "position"].y -= yscrollwidth
				_m[? "apply"](_m, modifierList)
			}
		
		ds_map_destroy(_mflat)
		
		var _shape = _m[? "shape"]
		var _size = _m[? "size"]
		var _position = _m[? "position"]
		var _rotation = _m[? "rotation"]
		var _scale = _m[? "scale"]
		
		var matrix = matrix_build(
		_position.x + frameXOffset, _position.y + frameYOffset, _position.z, 
		_rotation.x, _rotation.y, _rotation.z, 
		_scale.x / 2, _scale.y / 2, _scale.z / 2
		)
		matrix_set(matrix_world, matrix)
		
		draw_set_color(_shape.color)
		draw_set_alpha(_shape.alpha)
		
		if (asset_get_type(_shape.texture) == asset_sprite) {
			draw_sprite_ext(_shape.texture, _shape.index, 0, 0, _size.x, _size.y, 0, _shape.color, _shape.alpha)
		}
		else switch (_shape.texture) {
			case "rectangle":
			draw_rectangle(-_size.x / 2, -_size.y / 2, _size.x / 2, _size.y / 2, false)
			break
			case "ellipse":
			draw_ellipse(-_size.x / 2, -_size.y / 2, _size.x / 2, _size.y / 2, false)
			break
		}
		
		ds_map_destroy(_m)
	}
	matrix_set(matrix_world, matrix_build_identity())

	gpu_set_scissor(0, 0, display_get_width(), display_get_height())
	gpu_set_ztestenable(false)
	gpu_set_zwriteenable(false)
}