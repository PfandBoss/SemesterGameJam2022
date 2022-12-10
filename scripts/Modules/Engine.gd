extends Module
class_name TrainEngine


enum STATE {RUNNING, DEAD}

#------------Methods-------------#
func _ready():
	var root = get_tree().root.get_child(0)
	maxStashValue = 100
	currentStashValue = 100
	currentState = STATE.RUNNING
#TODO: FINISH
func interact():
	if currentState == STATE.RUNNING:
		if currentStashValue < maxStashValue:
			currentStashValue += 10 
			if currentStashValue > maxStashValue:
				currentStashValue = maxStashValue
				
		return
	#TODO: Repair Train
	currentState = STATE.RUNNING
	


