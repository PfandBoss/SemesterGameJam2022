extends Module

class_name Bin

@onready var train = get_parent() as Train

#------------Methods-------------#
func interact(player):
	train.get_node("CharacterBody3D").inventory = 0
