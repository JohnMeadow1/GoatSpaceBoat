extends Spatial

const ROTATION_SPEED := 1.0

onready var player := $Player as KinematicBody
onready var camera := $Camera as Camera
onready var station := $Station as Spatial

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		station.rotate_z(-ROTATION_SPEED * delta)
	if Input.is_action_pressed("left"):
		station.rotate_z(ROTATION_SPEED * delta)
