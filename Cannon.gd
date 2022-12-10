extends Module

class_name Cannon

enum STATE {INACTIVE, RELOADING, SHOOTING}
#------------Methods-------------#
func _ready():
	var root = get_tree().root.get_child(0)
	root.timeout.connect("shooting",self,"_on_signal_shooting")
	maxStashValue = 1
	currentStashValue = 0
	currentState = STATE.INACTIVE
#TODO: FINISH
func interact():
	if currentState == STATE.INACTIVE:
		if currentStashValue < maxStashValue:
			currentState = STATE.RELOADING
			currentStashValue = maxStashValue
		return
		
	return

func _on_signal_shooting():
	if currentStashValue == 1:
		currentState = STATE.SHOOTING
	#TODO shooting
	currentState = STATE.INACTIVE
	pass
