extends RefCounted
## Fixtures for "reduce_access_paths". Every case here behaves one way in the baseline export and
## another in the reduced one, which is the point - the same source has to survive both.
##
## Under reduction a dotted chain is rewritten to a direct preload of the deepest segment that
## names a real script, and a hub every one of whose mentions got rewritten is then dropped from
## the export entirely.

## The declaration form. The general rewrite would turn this into "const UList = UList", so the
## declaration has to become the preload itself.
const UList = ALibRuntime.Utils.UList

## A matching direct preload must satisfy reduction instead of being injected a second time.
const UObject = preload("res://addons/_lib/brohd/alib_runtime/utils/u_object.gd")

## Singletons is used bare below, so unlike ALibRuntime it must NOT be pruned even though this
## chain reduces.
const SingletonBase = Singletons.Base


static func next_index(size:int, current:int) -> int:
	## Chain ending on a file: reduces to the bound name outright.
	return ALibRuntime.Utils.UList.get_next_item(size, current)


static func token_pattern() -> String:
	## Head is already the deepest file it names, so reduction must leave this alone rather than
	## rewrite it to itself. Tokenizer also stays a genuine use of the class.
	return Tokenizer.pattern


static func object_script() -> GDScript:
	return ALibRuntime.Utils.UObject


static func hub_script() -> GDScript:
	## A bare use of the hub, not the head of anything. This is what keeps Singletons in the
	## export - one mention that no reduction rewrites away is enough to save it.
	return Singletons


static func base_is_node() -> bool:
	return SingletonBase != null and UList != null
