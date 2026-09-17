extends RefCounted

const Helpers = preload("res://addons/plugin_exporter_test/src/core/optimizer_helpers.gd")
const Vec = preload("res://addons/plugin_exporter_test/src/core/struct_vec.gd")

static func run() -> Array:
	var local := Vec.new(2.0, 3.0)
	var scalar:float = local.x + local.y
	var number:float = 4.0
	var direct:float = Helpers.affine(number)
	var expanded:float = Helpers.vector_score(Vector2(2.0, 3.0))
	var combined:float = Helpers.struct_score(Vec.new(4.0, 5.0))
	return [scalar, direct, expanded, combined]

class Payload:
	var value:int = 7

#! struct
class Record:
	var payload:Payload
	var items:Array = [1]
	func _init(p:Payload) -> void:
		payload = p

static func reference_score() -> int:
	var record := Record.new(Payload.new())
	record.items.append(4)
	return record.payload.value + record.items.size()

static func path_check(path:String) -> bool:
	if Helpers.is_gdscript_path(path):
		return true
	return false

static func dynamic_path_check(path:Variant) -> bool:
	return false or Helpers.is_gdscript_path(path)

static var predicate_calls:int = 0

static func predicate(value:bool) -> bool:
	predicate_calls += 1
	return value

static func substitution_check() -> int:
	predicate_calls = 0
	if Helpers.all_values(predicate(false), predicate(true)):
		return -1
	return predicate_calls

static func nested_check(value:float) -> float:
	return Helpers.chained(Helpers.affine(value))
