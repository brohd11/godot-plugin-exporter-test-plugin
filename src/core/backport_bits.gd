@abstract
extends RefCounted
## Deliberately minimal backport coverage - the class-level annotation above, which a pre-4.4
## target strips, and the EditorInterface rewrite below. The heavier backports (static vars,
## context menus) are on their way out, so there is no point growing fixtures for them.
##
## No abstract *method* here on purpose: stripping the annotation off one leaves a bodiless func,
## which is not valid GDScript at any version.


static func editor_base_control() -> Control:
	## With "replace_editor_interface" on, this becomes Engine.get_singleton(&"EditorInterface").
	return EditorInterface.get_base_control()


func describe() -> String:
	return "backport-fixture"
