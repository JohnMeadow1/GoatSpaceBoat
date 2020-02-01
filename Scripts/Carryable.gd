extends StaticBody
class_name Carryable

func _input_event(camera: Object, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if not Singleton.player_node.carried:
			Singleton.player_node.carry(self)
			on_carry()

func on_carry():
	pass
