enabled = false

frameXOffset = 0
frameYOffset = 0

frameXStart = room_width * 0
frameXEnd = room_width * 1
frameYStart = room_height * 0
frameYEnd = room_height * 1
xdistance = 32
ydistance = 32
xscrollspeed = 0
yscrollspeed = 0
xoffset = 0
yoffset = 0
overflow = 2

flip = floor(random(2))*2-1
flipval = 3

shapeTemplate = shapeMatrix(
"rectangle", 0, c_white, 1, NaN, 
frameXStart + xoffset, frameYStart + yoffset, 0, 
64, 64, 1, 
0, 0, 0, 
1, 1, 1)

seedList = []

modifierList = [
function (_m) {
		_m[? "position"].z = _m[? "seed"] mod 10
		_m[? "size"].x = _m[? "size"].x + 1/60
		return _m
	}
]

function shapeMatrix(
texture, index, color, alpha, id, 
x, y, z, 
xsize, ysize, zsize, 
xrotation, yrotation, zrotation, 
xscale, yscale, zscale) {
	
	var matrix = ds_map_create()
	ds_map_add(matrix, "id", id)
	ds_map_add(matrix, "seed", noone)
	
	ds_map_add(matrix, "shape", { 
		texture: texture, 
		index: index, 
		color: color, 
		alpha: alpha 
		})
	
	ds_map_add(matrix, "position", { 
		x: x, 
		y: y, 
		z: z 
		})
	
	ds_map_add(matrix, "size", {
		x: xsize,
		y: ysize,
		z: zsize
	})
	
	ds_map_add(matrix, "rotation", { 
		x: xrotation, 
		y: yrotation, 
		z: zrotation 
		})
	
	ds_map_add(matrix, "scale", {
		x: xscale, 
		y: yscale, 
		z: zscale 
		})
	
	ds_map_add(matrix, "apply", function (_m, modifierList) {
		for (var i = 0; i < array_length(modifierList); i++){
			_m = modifierList[i](_m)
		}
	})
	ds_map_add(matrix, "getSeed", function (_m, id) {
		if _m[? "seed"] != noone
			return _m[? "seed"]
		var seedSize = 6
		if array_length(seedList) > id
			_m[? "seed"] = seedList[id]
		else {
			while true {
				var newSeed = random_range(sqr_n(10, seedSize), sqr_n(10, seedSize + 1) - 1)
				if not array_contains(seedList, newSeed) {
					_m[? "seed"] = newSeed
					array_push(seedList, newSeed)
					break
				}
			}
		}
		return _m[? "seed"]
	})
	return matrix
}

