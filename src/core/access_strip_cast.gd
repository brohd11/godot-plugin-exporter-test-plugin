extends RefCounted
## gdp-strip-cast on a reduced chain: the reducer renames `UtilR.Strings.UString.StringMap` to a
## binding before the strip runs, so the strip has to follow the rename.
#! gdp-strip-cast UtilR


static func typed(value) -> UtilR.Strings.UString.StringMap:
	var map:UtilR.Strings.UString.StringMap = value
	return map as UtilR.Strings.UString.StringMap
