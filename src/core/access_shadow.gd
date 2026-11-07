extends RefCounted
## Inside Inner, an inherited const named UName would shadow the outer class below without any
## error here, and the call would land on the wrong script.


class UName:
	static func marker() -> int:
		return 1


class Inner extends "res://addons/plugin_exporter_test/src/core/access_shadow_base.gd":
	static func read_marker() -> int:
		return UName.marker()
