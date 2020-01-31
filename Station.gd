extends Spatial

onready var player := $Player as KinematicBody
onready var camera := $Camera as Camera

func _process(delta: float) -> void:
	camera.translation.x = player.translation.x
