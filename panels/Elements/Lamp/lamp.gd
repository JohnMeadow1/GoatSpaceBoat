tool
extends Node2D

export var frequency:= 1.0 setget set_frequency
const colors_array = [Color.white, Color.red, Color.green, Color.blue]
enum COLORS { WHITE, RED, GREEN, BLUE }
export(COLORS) var color setget set_color
export var enabled := true setget set_enabled

func _ready():
	$AnimationPlayer.play("blink")
	$Light2D.color = colors_array[color]
	modulate = Color.white *0.70 + colors_array[color]*0.3
	$AnimationPlayer.playback_speed = frequency
	
	
func set_color(value):
	color = value
	
	if not is_inside_tree():
		yield(self, "ready")

	$Light2D.color = colors_array[color]
	modulate = Color.white *0.70 + colors_array[color]*0.3

func set_frequency(value:float):
	frequency = value
	
	if not is_inside_tree():
		yield(self, "ready")
	
	$AnimationPlayer.playback_speed = frequency

func set_enabled(e: bool):
	enabled = e
	
	if not is_inside_tree():
		yield(self, "ready")
	
	$Light2D.visible = enabled
