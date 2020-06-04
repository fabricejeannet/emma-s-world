extends Node2D

var held_object = null

func _ready():
	for node in get_tree().get_nodes_in_group("pickable"):
		node.connect("pressed", node, "pickup")
	
	for node in get_tree().get_nodes_in_group("ignitable"):
		node.connect("clicked", node.get_node("Light2D"), "switch")

	for node in get_tree().get_nodes_in_group("clickable"):
		node.connect("clicked", node.get_node("Sprite"), "clicked")
		
	for node in get_tree().get_nodes_in_group("popable"):
		node.connect("pressed", node.get_node("Sprite"), "pop_up")
		node.connect("released", node.get_node("Sprite"), "pop_down")
