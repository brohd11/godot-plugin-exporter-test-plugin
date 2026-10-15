extends RefCounted
## Fixtures for "reduce_access_paths". Every case here behaves one way in the baseline export and
## another in the reduced one, which is the point - the same source has to survive both.
##
## Under reduction a dotted chain is rewritten to a direct preload of the deepest segment that
## names a real script, and a hub every one of whose mentions got rewritten is then dropped from
## the export entirely.

## The declaration form. The general rewrite would turn this into "const UWindow = UWindow", so the
## declaration has to become the preload itself.
const UWindow = UtilR.Nodes.UWindow

## A matching direct preload must satisfy reduction instead of being injected a second time.
const UObject = preload("res://addons/_lib/util_r/src/object/u_object.gd")

## Singletons is used bare below, so unlike UtilR it must NOT be pruned even though this
## chain reduces.
const SingletonBase = Singletons.Base


static func control_position(control:Control) -> Vector2:
	## Chain ending on a file: reduces to the bound name outright.
	return UtilR.Nodes.UWindow.get_control_absolute_position(control)


static func yaml_node_kind() -> int:
	## Head is already the deepest file it names, so reduction must leave this alone rather than
	## rewrite it to itself. YAMLParser also stays a genuine use of the class.
	return YAMLParser.NODE_DICT


static func object_script() -> GDScript:
	return UtilR.Objects.UObject


static func hub_script() -> GDScript:
	## A bare use of the hub, not the head of anything. This is what keeps Singletons in the
	## export - one mention that no reduction rewrites away is enough to save it.
	return Singletons


static func base_is_node() -> bool:
	return SingletonBase != null and UWindow != null
