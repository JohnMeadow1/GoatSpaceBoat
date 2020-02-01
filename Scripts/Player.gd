extends KinematicBody

var carried: Spatial

func remove_carry():
	if carried:
		remove_child(carried)
		carried = null

func carry(node: Spatial):
	carried = node
	node.get_parent().remove_child(node)
	add_child(node)
	node.transform = Transform()
