class_name PETSingletonMod #! singleton-module 0.2.0
extends SingletonRefCount
## A singleton module: a plugin other plugins may reference. The exporter reads the tag above for
## the version and writes a "singleton_modules" entry into the export's ".export_data" file.

const SingletonRefCount = Singletons.RefCount

const PE_STRIP_CAST_SCRIPT = preload("res://addons/plugin_exporter_test/src/core/singleton_mod.gd")


static func get_singleton_name() -> String:
	return "PETSingletonMod"


static func get_instance() -> PE_STRIP_CAST_SCRIPT:
	return _get_instance(PE_STRIP_CAST_SCRIPT)


static func register_node(node) -> void:
	_register_node(PE_STRIP_CAST_SCRIPT, node)


static func unregister_node(node) -> void:
	_unregister_node(PE_STRIP_CAST_SCRIPT, node)
