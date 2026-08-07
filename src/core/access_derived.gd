extends "res://addons/plugin_exporter_test/src/core/access_base.gd"
## The other half: same expression as the base, so after export this file must use the bound name
## without declaring it a second time.


static func ranked_keys(priorities:Dictionary) -> Array:
	return ALibRuntime.Utils.USort.sort_priority_dict(priorities).keys()
