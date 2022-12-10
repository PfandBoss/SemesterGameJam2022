extends Module

class_name Bin

@onready var train = get_parent() as Train

#------------Methods-------------#
func interact(player):
	player.inventory = 0
