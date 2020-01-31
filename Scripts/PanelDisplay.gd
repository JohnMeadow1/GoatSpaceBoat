extends StaticBody

onready var camera_target := $Position3D as Spatial
onready var tween := $Tween as Tween

func _ready() -> void:
	var panel := get_child(get_child_count() - 1)
	remove_child(panel)
	$MeshInstance/Viewport.add_child(panel)
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	$MeshInstance.mesh.surface_get_material(0).albedo_texture = $MeshInstance/Viewport.get_texture()

func _input_event(camera: Object, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		tween.interpolate_property(camera, "global_transform:origin", camera.global_transform.origin, camera_target.global_transform.origin, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.interpolate_property(camera, "global_transform:basis", camera.global_transform.basis, camera_target.global_transform.basis, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
