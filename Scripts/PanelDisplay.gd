tool
extends StaticBody

onready var camera_target := $Position3D as Spatial
onready var tween := $Tween as Tween
onready var viewport := $MeshInstance/DisplayViewport as Viewport

var focused := false
var panel: Node2D

export var size := Vector2(10, 5) setget set_size
export var camera_distance := 5.0

var cam: Camera
var camera_origin: Transform

func _ready() -> void:
	if Engine.editor_hint:
		return
	
	panel = get_child(get_child_count() - 1)
	remove_child(panel)
	camera_target.translation.z = camera_distance
	
	viewport.add_child(panel)
	viewport.size = panel.get_rect().size
	$MeshInstance.mesh.surface_get_material(0).albedo_texture = viewport.get_texture()

func _input_event(camera: Object, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if not focused and not Singleton.player_locked:
		if event is InputEventMouseButton and event.is_pressed():
			cam = camera
			camera_origin = cam.global_transform
			
			tween.interpolate_property(cam, "global_transform:origin", cam.global_transform.origin, camera_target.global_transform.origin, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			tween.interpolate_property(cam, "global_transform:basis", cam.global_transform.basis, camera_target.global_transform.basis, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			tween.start()
			focused = true
			Singleton.player_locked = true
	elif focused:
		if event is InputEventMouse:
			var norm_click := to_local(click_position)
			var real_click := Vector2(norm_click.x, norm_click.y) + size / 2
			real_click.y = size.y - real_click.y
			event.position = real_click / size * viewport.size
			viewport.input(event)

func _input(event: InputEvent) -> void:
	if focused and not tween.is_active():
		if event is InputEventKey:
			if event.pressed and event.scancode == KEY_ESCAPE:
				tween.interpolate_property(cam, "global_transform:origin", camera_target.global_transform.origin, camera_origin.origin, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
				tween.interpolate_property(cam, "global_transform:basis", camera_target.global_transform.basis, camera_origin.basis, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
				tween.start()
				focused = false
				Singleton.player_locked = false

func set_size(s: Vector2):
	size = s
	
	if not is_inside_tree():
		yield(self, "ready")
	
	$MeshInstance.mesh.size = size
	$CollisionShape.shape.extents.x = size.x / 2
	$CollisionShape.shape.extents.y = size.y / 2
