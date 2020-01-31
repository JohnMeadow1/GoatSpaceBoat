extends Sprite

export var value := 0.0
export var min_value = -40.0
export var max_value = 90.0
export var random_offset_range = 0.0
var random_offset = 0.0

func _ready():
	pass

func _process(delta):
#	value += 1
#	value = fmod(value, 100)
	random_offset = lerp(random_offset, rand_range(-random_offset_range,random_offset_range), 0.1)
	$Pointer.rotation_degrees = (max_value-min_value) * (value * 0.01) + random_offset + min_value 
	
func set_random_offset_range(new_value):
	random_offset_range = new_value

