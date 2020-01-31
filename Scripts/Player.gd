extends KinematicBody

var velocity: Vector3
var up := Vector3.UP

func _physics_process(delta: float) -> void:
	velocity += -up * 100 * delta
	
	if Input.is_action_pressed("right"):
		velocity += x_vector() * 100 * delta
	if Input.is_action_pressed("left"):
		velocity -= x_vector() * 100 * delta
	if Input.is_action_pressed("forward"):
		velocity += z_vector() * 100 * delta
	if Input.is_action_pressed("backward"):
		velocity -= z_vector() * 100 * delta
	
	velocity = move_and_slide(velocity, up)
	
	if is_on_floor() and get_slide_count() == 1:
		var floo := get_slide_collision(0)
		up = floo.normal
		rotation.z = -up.x

func x_vector() -> Vector3:
	return up.rotated(Vector3.FORWARD, PI/2)

func z_vector() -> Vector3:
	return x_vector().rotated(Vector3.UP, PI/2)
