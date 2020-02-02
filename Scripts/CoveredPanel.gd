extends Sprite

export var underpanel: PackedScene

var screws: int
var fall: float

func _ready() -> void:
	for node in get_children():
		if node.has_meta("screw"):
			screws += 1
			node.connect("finished", self, "screw_end")

func _physics_process(delta: float) -> void:
	if fall:
		fall += delta * 10
		position.y += fall

func screw_end():
	screws -= 1
	if screws == 0:
		fall()

func _on_DebugButton_pressed() -> void:
	fall()

func fall():
	var underiinstance = underpanel.instance()
	get_parent().add_child(underiinstance)
	underiinstance.set_meta("display", get_meta("display"))
	fall = 1
	get_tree().create_timer(2).connect("timeout", self, "queue_free")
