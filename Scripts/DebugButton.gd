extends Button

func _ready() -> void:
	if not OS.has_feature("editor"):
		queue_free()
