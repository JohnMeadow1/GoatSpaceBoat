extends Spatial

const ROTATION_SPEED := 1.0

onready var player := $Player as KinematicBody
onready var camera := $Camera as Camera
onready var pivot := $StationPivot as Spatial

func _ready() -> void:
	Singleton.player_node = player

func _physics_process(delta: float) -> void:
	if Singleton.player_locked:
		return
	
	if Input.is_action_pressed("right"):
		pivot.rotate_z(-ROTATION_SPEED * delta)
	if Input.is_action_pressed("left"):
		pivot.rotate_z(ROTATION_SPEED * delta)
