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
		#TODO: RELOADING
		if currentStashValue < maxStashValue:
			currentState = STATE.RELOADING
			currentStashValue = maxStashValue
		return
		
	return

func _on_signal_shooting():
	if currentStashValue == 1:
		currentState = STATE.SHOOTING
	#TODO: SHOOTING
	currentState = STATE.INACTIVE
	pass
