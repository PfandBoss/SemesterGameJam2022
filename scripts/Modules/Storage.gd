extends Module

class_name Storage

enum TYPE {AMMO, GUNPOWDER, COAL, LARGE, GIANT}


@export var currentType: TYPE

@export var icon : Texture2D
@export var audioClip : AudioStreamWAV
#------------Methods-------------#
func _ready():
	var root = get_tree().root.get_child(0)
	#root.ammo_pickup.connect(_on_signal_storing)
	maxStashValue = 10
	currentStashValue = 10
	$Sprite3D2.texture = icon
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

func on_Player_enter(blub):
	var bodies = $Area3D.get_overlapping_bodies()
	$Sprite3D2.visible = true
			
func on_Player_exit(blub):			
	$Sprite3D2.visible = false
