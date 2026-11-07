extends RefCounted
## Reaches the remote libraries of the hub rule: a hub outside the source is a pass-through, unless
## a subclass still calls through it or a tag lives in it.

const LibUser = preload("res://addons/gdpackage/export_ignore/test/fixtures/vendor/hub/lib_user.gd")
const LibDerived = preload("res://addons/gdpackage/export_ignore/test/fixtures/vendor/hub/lib_derived.gd")
const LibTaggedUser = preload("res://addons/gdpackage/export_ignore/test/fixtures/vendor/hub/lib_tagged_user.gd")


static func total() -> int:
	return LibUser.total() + LibDerived.ping() + LibTaggedUser.value()
