tool
extends Node2D

export var frequency:= 1.0 setget set_frequency
const colors_array = [Color.white, Color.red, Color.green, Color.blue]
#export(int, "red", "green", "blue") var color_idx
enum COLORS { WHITE, RED, GREEN, BLUE }
export(COLORS) var color setget set_color

func _ready():
	$AnimationPlayer.play("blink")
	$Light2D.color = colors_array[color]
	$AnimationPlayer.playback_speed = frequency
	
func set_color(value):
	color = value
	if Engine.editor_hint:
		$Light2D.color = colors_array[color]
#	if not is_inside_tree():
#		yield(self, "ready")


	
func set_frequency(value:float):
	frequency = value
	if Engine.editor_hint:
		$AnimationPlayer.playback_speed = frequency
#	if not is_inside_tree():
#		yield(self, "ready")
#

