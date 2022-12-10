extends Module

class_name Storage

enum TYPE {AMMO, GUNPOWDER, COAL, LARGE, GIANT}


@export var currentType: TYPE


@export var audioClip : AudioStreamWAV
#------------Methods-------------#
func _ready():
	var root = get_tree().root.get_child(0)
	#root.ammo_pickup.connect(_on_signal_storing)
	maxStashValue = 10
	currentStashValue = 10
	$AudioStreamPlayer.stream = audioClip
	
func interact(player):
	if currentStashValue >= 1:
		currentStashValue -= 1
		player.fill_inventory(currentType)
		$AudioStreamPlayer.play()
	return
	
func _on_signal_storing():
	if currentStashValue < maxStashValue:
			currentStashValue += 1
	return
	
