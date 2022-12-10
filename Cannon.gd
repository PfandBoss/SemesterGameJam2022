extends Module

class_name Cannon

enum STATE {INACTIVE, RELOADING, SHOOTING}

#------------Methods-------------#
func _ready():
	var root = get_tree().root.get_child(0)
	root.shooting.connect(_on_signal_shooting)
	maxStashValue = 1
	currentStashValue = 0
	currentState = STATE.INACTIVE
#TODO: FINISH
func interact():
	if currentState == STATE.INACTIVE:
		#TODO: RELOADING
		if currentStashValue < maxStashValue:
			currentState = STATE.RELOADING
			currentStashValue += 1
		return
		
	return

func _on_signal_shooting():
	if currentStashValue >= 1 and currentState == STATE.INACTIVE:
		currentState = STATE.SHOOTING
		currentStashValue -= 1
		#TODO: SHOOTING
		currentState = STATE.INACTIVE
	return
