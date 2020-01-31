extends StaticBody

onready var camera_target := $Position3D as Spatial
onready var tween := $Tween as Tween

var focused := false
var panel: Node2D

var cam: Camera
var camera_origin: Transform

func _ready() -> void:
	panel = get_child(get_child_count() - 1)
	remove_child(panel)
	$MeshInstance/Viewport.add_child(panel)
	$MeshInstance.mesh.surface_get_material(0).albedo_texture = $MeshInstance/Viewport.get_texture()

func _input_event(camera: Object, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if not focused:
		if event is InputEventMouseButton and event.is_pressed():
			cam = camera
			camera_origin = cam.global_transform
			
			tween.interpolate_property(cam, "global_transform:origin", cam.global_transform.origin, camera_target.global_transform.origin, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			tween.interpolate_property(cam, "global_transform:basis", cam.global_transform.basis, camera_target.global_transform.basis, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			tween.start()
			focused = true

func _input(event: InputEvent) -> void:
	if focused and not tween.is_active():
		if event is InputEventKey:
			if event.pressed and event.scancode == KEY_ESCAPE:
				tween.interpolate_property(cam, "global_transform:origin", camera_target.global_transform.origin, camera_origin.origin, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
				tween.interpolate_property(cam, "global_transform:basis", camera_target.global_transform.basis, camera_origin.basis, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
				tween.start()
				focused = false
