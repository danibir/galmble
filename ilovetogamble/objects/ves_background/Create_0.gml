enabled = false

frameXOffset = 0
frameYOffset = 0

frameXStart = room_width * 0
frameXEnd = room_width * 1
frameYStart = room_height * 0
frameYEnd = room_height * 1
xdistance = 48
ydistance = 48
xscrollspeed = 0
yscrollspeed = 0
xoffset = 0
yoffset = 0
overflow = 1

seedList = []

shapeTemplate = new shapeMatrix(
"rectangle", 0, c_white, 1, NaN, 
frameXStart + xoffset, frameYStart + yoffset, 0, 
48, 48, 1, 
0, 0, 0, 
1, 1, 1)


modifierList = [
]


overflowresetx = ceil((frameXEnd - frameXStart) / xdistance + overflow * 2) * xdistance
overflowresety = ceil((frameYEnd - frameYStart) / ydistance + overflow * 2) * xdistance


function shapeMatrix(
_texture, _index, _color, _alpha, _id, 
_x, _y, _z, 
_xsize, _ysize, _zsize, 
_xrotation, _yrotation, _zrotation, 
_xscale, _yscale, _zscale) 
constructor {
	
	data =  {
		seedlength: 6
	}
	
	identity = _id
	seed = noone
	shape = { 
		texture: _texture, 
		index: _index, 
		color: _color, 
		alpha: _alpha 
	}
	position = { 
		x: _x, 
		y: _y, 
		z: _z 
	}
	size = {
		x: _xsize,
		y: _ysize,
		z: _zsize
	}
	rotation = {
		x: _xrotation,
		y: _yrotation,
		z: _zrotation
	}
	scale = {
		x: _xscale, 
		y: _yscale, 
		z: _zscale 
	}
	apply = function (modifierList) {
		for (var i = 0; i < array_length(modifierList); i++){
			modifierList[i](self)
		}
		return self
	}
	getRanSeed = function (range = false) {
		var seedSize = self.data.seedlength
		var seed = ceil(random_range(sqr_n(10, seedSize - 1), sqr_n(10, seedSize) - 1))
		if range != false
			seed = seed mod range
		return seed
	}
	setSeed = function (id, takenIds) {
		if self.seed != noone
			return { seed: self.seed, takenIds: takenIds}
			
		if array_length(takenIds) > id
			self.seed = takenIds[id]
		else {
			while true {
				var newSeed = self.getRanSeed()
				if not array_contains(takenIds, newSeed) {
					self.seed = newSeed
					array_push(takenIds, newSeed)
					break
				}
			}
		}
		return { seed: self.seed, takenIds: takenIds}
	}
	getDetSeed = function (range, count) {
		var seedSize = self.data.seedlength
		if self.seed = noone
			return NaN
			
		var seed = self.seed
		for (var i = 1; i < count; i++) {
			seed = sqr(seed)
			var seedlength = string_length(string(seed)) - seedSize
			seed = ceil((seed / sqr_n(10, seedlength)))
		}
		return seed mod range
	}
}

function shapeMatrixClone (matrix) {
		var newshape = new shapeMatrix(
	        matrix.shape.texture, matrix.shape.index, matrix.shape.color, matrix.shape.alpha, matrix.identity,
	        matrix.position.x, matrix.position.y, matrix.position.z,
	        matrix.size.x, matrix.size.y, matrix.size.z,
	        matrix.rotation.x, matrix.rotation.y, matrix.rotation.z,
	        matrix.scale.x, matrix.scale.y, matrix.scale.z
	    )
		newshape.seed = matrix.seed
	    return newshape
	}

