class_name PETSingletonMod
extends "res://addons/_lib/singleton/src/singleton_ref_count.gd" #! ext Singletons.RefCount
## A singleton module: a plugin other plugins may reference. The exporter writes a "singleton_modules"
## entry into the export's ".export_data" file, versioned from the nearest package cfg.

#! gdp-strip-cast PE_STRIP_CAST_SCRIPT
const PE_STRIP_CAST_SCRIPT = preload("res://addons/plugin_exporter_test/src/core/singleton_mod.gd")


static func get_singleton_name() -> String:
	return "PETSingletonMod"


static func get_instance() -> PE_STRIP_CAST_SCRIPT:
	return _get_instance(PE_STRIP_CAST_SCRIPT)


static func register_node(node) -> void:
	_register_node(PE_STRIP_CAST_SCRIPT, node)


static func unregister_node(node) -> void:
	_unregister_node(PE_STRIP_CAST_SCRIPT, node)
