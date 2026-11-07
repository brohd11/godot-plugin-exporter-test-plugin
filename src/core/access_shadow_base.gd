extends RefCounted
## Reduces a chain in its body, so the export injects a const here for every subclass to inherit.


static func unique(base_name:String, taken:Array) -> String:
	return UtilR.Strings.UName.incremental_name_check_in_array(base_name, taken)
