extends RefCounted
## Half of the inherited-binding pair. Both this and access_derived.gd reduce the same expression,
## and GDScript rejects redeclaring an inherited constant - so the derived script must rewrite its
## uses but let the const come down the chain from here.

const USort = ALibRuntime.Utils.USort


static func ranked(priorities:Dictionary) -> Dictionary:
	return ALibRuntime.Utils.USort.sort_priority_dict(priorities)
