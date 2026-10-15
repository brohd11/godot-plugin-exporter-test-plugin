extends RefCounted
## The enum-tail reduction case, kept in its own file: StringMap is the deepest segment naming a
## real script, so ".Mode.STRING" has to survive on the end of the rewritten expression.
##
## Deliberately the only reference to string_map.gd anywhere in the fixture - nothing else preloads
## it - so this file is also what proves a reduction target gets pulled into the export on the
## strength of the access path alone.


static func string_mode() -> int:
	return UtilR.Strings.UString.StringMap.Mode.STRING
