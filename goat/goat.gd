extends KinematicBody

var timer = 0.0

func _ready():
	pass

func _physics_process(delta):
	timer -= delta
	if timer < 0 :
		get_node("meeeh/Meeeh_" + str( randi() % 8 + 1 ) ).play()
		timer = rand_range(5.0, 10)

func _input_event(camera: Object, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			Singleton.player_node.carry(self)
