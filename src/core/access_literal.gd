extends RefCounted
## A const that is a plain value needs nothing but the value, so the file it came from is no
## dependency of this one. The follow-up to the class form in access_paths.gd.

const LeafLib = preload("res://addons/gdpackage/export_ignore/test/fixtures/vendor/hub/lib_leaf.gd")
const MY_INT = LeafLib.VALUE

const Hub2 = preload("res://addons/gdpackage/export_ignore/test/fixtures/vendor/hub/lib_rebind_hub.gd")
const Leaf = Hub2.Leaf
const PLAIN = Leaf.VALUE


static func twice() -> int:
	return LeafLib.VALUE + MY_INT


static func through_the_chain() -> Dictionary:
	## Every `Leaf.` mention here is a plain value, which alone would free its declaration,
	## but this chain rewrites onto that very name.
	return Hub2.Leaf.new().get_script().get_script_constant_map()
