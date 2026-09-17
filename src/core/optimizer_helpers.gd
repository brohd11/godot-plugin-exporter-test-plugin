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

#! inline
static func is_gdscript_path(path:String) -> bool:
	return path.ends_with(".gd") or path.contains(".gd.") or path.contains(".gd::")

#! inline; substitute
static func all_values(...values:Array) -> bool:
	for value in values:
		if not value:
			return false
	return true

#! inline
static func chained(value:float) -> float:
	return affine(affine(value))

#! inline
static func early_value(value:int) -> int:
	if value < 0:
		return -1
	if value == 0:
		return 2
	return value + 3

#! inline
static func early_effect(events:Array, value:int) -> void:
	if value < 0:
		events.append("early")
		return
	events.append(value)
