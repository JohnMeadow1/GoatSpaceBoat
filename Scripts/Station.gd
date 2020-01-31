extends Spatial

onready var player := $Player as KinematicBody
onready var camera := $Camera as Camera

func _process(delta: float) -> void:
	camera.translation = player.translation - player.z_vector() * 5 + player.up * 5
	camera.rotation.z = player.rotation.z
