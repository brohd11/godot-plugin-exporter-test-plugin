@tool
extends Control
## Root script of fixture_scene.tscn. The exports hold the scene's other two ext_resources so the
## scene references both an in-plugin resource and an out-of-plugin scene without instancing
## either one.

@export var fixture_resource:Resource
@export var popup_scene:PackedScene


func _ready() -> void:
	if fixture_resource != null:
		name = "PETSceneRoot"
