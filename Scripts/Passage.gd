extends Area

const MOVE := 40

onready var tween := $Tween as Tween

var player_in: Spatial

func _input(event: InputEvent) -> void:
	if not player_in or Singleton.player_locked or not event.is_action_type():
		return
	
	if Input.is_action_just_pressed("forward") and player_in.global_transform.origin.z > global_transform.origin.z:
		Singleton.player_locked = true
		var seq := TweenSequence.new(get_tree())
		seq.append(player_in.mc, "rotation:y", PI/2, 0.5)
		seq.append(get_parent().get_parent(), "translation:z", get_parent().get_parent().translation.z + MOVE, 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		seq.append(player_in.mc, "rotation:y", player_in.mc.rotation.y, 0.5)
		seq.append_callback(Singleton, "set", ["player_locked", false])
	elif Input.is_action_just_pressed("backward") and player_in.global_transform.origin.z < global_transform.origin.z:
		Singleton.player_locked = true
		var seq := TweenSequence.new(get_tree())
		seq.append(player_in.mc, "rotation:y", -PI/2, 0.5)
		seq.append(get_parent().get_parent(), "translation:z", get_parent().get_parent().translation.z - MOVE, 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		seq.append(player_in.mc, "rotation:y", player_in.mc.rotation.y, 0.5)
		seq.append_callback(Singleton, "set", ["player_locked", false])

func _on_Passage_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.get_node("CanGo").visible = true
		player_in = body

func _on_Passage_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		body.get_node("CanGo").visible = false
		player_in = null
