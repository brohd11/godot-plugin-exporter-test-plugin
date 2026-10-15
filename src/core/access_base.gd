extends RefCounted
## Half of the inherited-binding pair. Both this and access_derived.gd reduce the same expression,
## and GDScript rejects redeclaring an inherited constant - so the derived script must rewrite its
## uses but let the const come down the chain from here.

const UName = UtilR.Strings.UName


static func unique_name(base_name:String, taken:Array) -> String:
	return UtilR.Strings.UName.incremental_name_check_in_array(base_name, taken)
