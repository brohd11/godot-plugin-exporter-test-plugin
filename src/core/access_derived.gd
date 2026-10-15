extends "res://addons/plugin_exporter_test/src/core/access_base.gd"
## The other half: same expression as the base, so after export this file must use the bound name
## without declaring it a second time.


static func unique_upper(base_name:String, taken:Array) -> String:
	return UtilR.Strings.UName.incremental_name_check_in_array(base_name, taken).to_upper()
