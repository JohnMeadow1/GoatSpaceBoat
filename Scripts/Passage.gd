extends Area

onready var tween := $Tween as Tween

var player_in: Spatial

func _ready() -> void:
	tween.connect("tween_all_completed", Singleton, "set", ["player_locked", false])

func _input(event: InputEvent) -> void:
	if not player_in or Singleton.player_locked or not event.is_action_type():
		return
	
	if Input.is_action_just_pressed("forward") and player_in.global_transform.origin.z > global_transform.origin.z:
		Singleton.player_locked = true
		tween.interpolate_property(get_parent(), "translation:z", get_parent().translation.z, get_parent().translation.z + 50, 3, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
	elif Input.is_action_just_pressed("backward") and player_in.global_transform.origin.z < global_transform.origin.z:
		Singleton.player_locked = true
		tween.interpolate_property(get_parent(), "translation:z", get_parent().translation.z, get_parent().translation.z - 50, 3, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()

func _on_Passage_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.get_node("CanGo").visible = true
		player_in = body

func _on_Passage_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		body.get_node("CanGo").visible = false
		player_in = null
