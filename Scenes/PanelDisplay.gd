extends StaticBody

func _input_event(camera: Object, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		$Tween.interpolate_property(camera, "global_transform:origin", camera.global_transform.origin, $Position3D.global_transform.origin, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		$Tween.interpolate_property(camera, "global_transform:basis", camera.global_transform.basis, $Position3D.global_transform.basis, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		$Tween.start()
