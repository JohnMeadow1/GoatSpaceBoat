extends Sprite

export var underpanel: PackedScene

var screws: int

func _ready() -> void:
	for node in get_children():
		if node.has_meta("screw"):
			screws += 1
			node.connect("finished", self, "screw_end")

func screw_end():
	screws -= 1
	if screws == 0:
		get_parent().add_child(underpanel.instance())
		queue_free()
