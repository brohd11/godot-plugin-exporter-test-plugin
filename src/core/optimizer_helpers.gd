extends RefCounted

const Vec = preload("res://addons/plugin_exporter_test/src/core/struct_vec.gd")

#! inline
static func affine(value:float) -> float:
	return value * 2.0 + 1.0

#! inline
static func vector_score(value:Vector2) -> float:
	var doubled:Vector2 = value * 2.0
	if doubled.x > 0.0:
		return doubled.x + doubled.y
	else:
		return doubled.y

#! inline
static func struct_score(value:Vec) -> float:
	return value.x + value.y
