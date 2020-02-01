tool
extends Node2D

export var frequency:= 1.0 setget set_frequency
const colors_array = [Color.white, Color.red, Color.green, Color.blue]
enum COLORS { WHITE, RED, GREEN, BLUE }
export(COLORS) var color setget set_color

func _ready():
	$AnimationPlayer.play("blink")
	$Light2D.color = colors_array[color]
	modulate = Color.white *0.70 + colors_array[color]*0.3
	$AnimationPlayer.playback_speed = frequency
	
	
func set_color(value):
	color = value
	if is_inside_tree():
		$Light2D.color = colors_array[color]
		modulate = Color.white *0.70 + colors_array[color]*0.3

func set_frequency(value:float):
	frequency = value
	if is_inside_tree():
		$AnimationPlayer.playback_speed = frequency

