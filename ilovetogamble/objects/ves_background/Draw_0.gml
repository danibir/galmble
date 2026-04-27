
if enabled
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
		var _m = shapeMatrixClone(shapeTemplate)
		
		_m.identity = count
		var seed = _m.setSeed(count, seedList)
		_m.seed = seed.seed
		seedList = seed.takenIds
		_m.position.x = xdistance * _x + xoffset
		_m.position.y = ydistance * _y + yoffset
		
		var _mflat = shapeMatrixClone(_m)
		_mflat.seed = _m.seed
		
		_m.apply(modifierList)
		
		var xscrollwidth = ceil((frameXEnd - frameXStart) / xdistance + overflow * 2) * xdistance
		var yscrollwidth = ceil((frameYEnd - frameYStart) / ydistance + overflow * 2) * ydistance
		if _m.position.x < frameXStart - xdistance * overflow 
			while _m.position.x < frameXStart - xdistance * overflow {
				_mflat.position.x += xscrollwidth
				_m = shapeMatrixClone(_mflat)
				_m.apply(modifierList)
			}
		else if _m.position.x > frameXEnd + xdistance * overflow
			while _m.position.x > frameXEnd + xdistance * overflow {
				_mflat.position.x -= xscrollwidth
				_m = shapeMatrixClone(_mflat)
				_m.apply(modifierList)
			}
		
		if _m.position.y < frameYStart - ydistance * overflow
			while _m.position.y < frameYStart - ydistance * overflow {
				_mflat.position.y += yscrollwidth
				_m = shapeMatrixClone(_mflat)
				_m.apply(modifierList)
			}
		else if _m.position.y > frameYEnd + ydistance * overflow 
			while _m.position.y > frameYEnd + ydistance * overflow {
				_mflat.position.y -= yscrollwidth
				_m = shapeMatrixClone(_mflat)
				_m.apply(modifierList)
			}
			
		if _m.position.x < frameXStart - xdistance * overflow 
			while _m.position.x < frameXStart - xdistance * overflow {
				_mflat.position.x += xscrollwidth
				_m = shapeMatrixClone(_mflat)
				_m.apply(modifierList)
			}
		else if _m.position.x > frameXEnd + xdistance * overflow
			while _m.position.x > frameXEnd + xdistance * overflow {
				_mflat.position.x -= xscrollwidth
				_m = shapeMatrixClone(_mflat)
				_m.apply(modifierList)
			}
			
		if _m.position.y < frameYStart - ydistance * overflow
			while _m.position.y < frameYStart - ydistance * overflow {
				_mflat.position.y += yscrollwidth
				_m = shapeMatrixClone(_mflat)
				_m.apply(modifierList)
			}
		else if _m.position.y > frameYEnd + ydistance * overflow 
			while _m.position.y > frameYEnd + ydistance * overflow {
				_mflat.position.y -= yscrollwidth
				_m = shapeMatrixClone(_mflat)
				_m.apply(modifierList)
			}
		
		var matrix = matrix_build(
		_m.position.x + frameXOffset, _m.position.y + frameYOffset, _m.position.z, 
		_m.rotation.x, _m.rotation.y, _m.rotation.z, 
		_m.scale.x / 2, _m.scale.y / 2, _m.scale.z / 2
		)
		matrix_set(matrix_world, matrix)
		
		draw_set_color(_m.shape.color)
		draw_set_alpha(_m.shape.alpha)
		
		if (asset_get_type(_m.shape.texture) == asset_sprite) {
			draw_sprite_ext(_m.shape.texture, _m.shape.index, 0, 0, _m.size.x, _m.size.y, 0, _m.shape.color, _m.shape.alpha)
		}
		else switch (_m.shape.texture) {
			case "rectangle":
			draw_rectangle(-_m.size.x / 2, -_m.size.y / 2, _m.size.x / 2, _m.size.y / 2, false)
			break
			case "ellipse":
			draw_ellipse(-_m.size.x / 2, -_m.size.y / 2, _m.size.x / 2, _m.size.y / 2, false)
			break
		}
	}
	matrix_set(matrix_world, matrix_build_identity())

	gpu_set_scissor(0, 0, display_get_width(), display_get_height())
	gpu_set_ztestenable(false)
	gpu_set_zwriteenable(false)
}