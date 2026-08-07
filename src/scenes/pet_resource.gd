@tool
class_name PETResource
extends Resource
## Backs fixture_resource.tres. A .tres names its script by class in the [gd_resource] header, and
## that header cannot be rewritten - so parse_tres has to keep this class out of the renames.

@export var label:String = ""
@export var weight:int = 0
