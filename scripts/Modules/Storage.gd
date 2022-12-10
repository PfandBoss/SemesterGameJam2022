extends Module

class_name Storage

enum TYPE {AMMO, GUNPOWDER, FUEL}

@export var currentType: TYPE

#------------Methods-------------#
func _ready():
	var root = get_tree().root.get_child(0)
	root.ammo_pickup.connect(_on_signal_storing)
	maxStashValue = 5
	currentStashValue = 0
func interact():
	if currentStashValue >= 1:
		currentStashValue -= 1
		
	return
	
func _on_signal_storing():
	if currentStashValue < maxStashValue:
			currentStashValue += 1
	return
	
