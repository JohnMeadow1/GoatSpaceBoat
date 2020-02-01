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
		get_parent().add_child(underpanel.instance())
		fall = 1
