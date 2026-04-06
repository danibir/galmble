backgroundItemXscale = 32
backgroundItemYscale = 32
backgroundItemRotation = 0
backgroundItemAlpha = 1
xdistance = 64
ydistance = 64
xoffset = 0
yoffset = 0
xscrollspeed = 3
yscrollspeed = 0

modifierList = [
transformInside("zrotation", "x", -0.25),
transformInside("zrotation", "y", -0.5)
]

function shapeMatrix(shape, color, alpha, id, x, y, z, xrotation, yrotation, zrotation, xscale, yscale, zscale) {
	var matrix = ds_map_create()
	ds_map_add(matrix, "shape", shape)
	ds_map_add(matrix, "color", color)
	ds_map_add(matrix, "alpha", alpha)
	ds_map_add(matrix, "id", id)
	ds_map_add(matrix, "x", x)
	ds_map_add(matrix, "y", y)
	ds_map_add(matrix, "z", z)
	ds_map_add(matrix, "xrotation", xrotation)
	ds_map_add(matrix, "yrotation", yrotation)
	ds_map_add(matrix, "zrotation", zrotation)
	ds_map_add(matrix, "xscale", xscale)
	ds_map_add(matrix, "yscale", yscale)
	ds_map_add(matrix, "zscale", zscale)
	return matrix
}

function transformInside(subject, input, modifier) {
    return {
        subject: subject,
        input: input,
        modifier: modifier,

        apply: function(m) {
            m[? subject] += m[? input] * modifier;
            return m;
        }
    }
}
function transformOutside(subject, input) {
	return {
		subject: subject,
		input: input,
		
		apply: function(m) {
			m[? subject] += input
			return m;
		}
	}
}