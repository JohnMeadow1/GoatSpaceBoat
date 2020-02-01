extends KinematicBody

onready var mc := $MC as Spatial

var carried: Spatial

func remove_carry():
	if carried:
		$CarryPoint.remove_child(carried)
		carried = null

func carry(node: Spatial):
	carried = node
	node.get_parent().remove_child(node)
	$CarryPoint.add_child(node)
	node.transform = Transform()
