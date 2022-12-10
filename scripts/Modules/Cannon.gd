extends Module

class_name Cannon

enum STATE {INACTIVE, RELOADING, SHOOTING}

var CAN_ENGAGE = true

#------------Methods-------------#
func _ready():
	var root = get_tree().root.get_child(0)
	root.shoot.connect(_on_signal_shooting)
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
	if not CAN_ENGAGE:
		return
	CAN_ENGAGE = false
	create_tween().tween_callback(func(): CAN_ENGAGE = true).set_delay(2)
	
	if currentStashValue >= 1 and currentState == STATE.INACTIVE:
		currentState = STATE.SHOOTING
		currentStashValue -= 1
		print("hit")
		currentState = STATE.INACTIVE
	return
