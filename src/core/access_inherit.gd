extends "res://addons/plugin_exporter_test/src/core/access_inherit_base.gd"
## The chain lands on the const it inherits, and redeclaring that is a compile error.


static func position(control:Control) -> Vector2:
	return UtilR.Nodes.UWindow.get_control_absolute_position(control)
