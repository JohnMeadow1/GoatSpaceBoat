tool
extends Spatial

export var open: bool setget set_open

signal opened()

func set_open(o: bool):
	open = o
	if open:
		emit_signal("opened")
	
	if not is_inside_tree():
		yield(self, "ready")
	
	$Capsule_open.visible = open
	$Capsule_closed.visible = !open
