extends Module
class_name TrainEngine


enum STATE {RUNNING, DEAD}
const maxSpeed = 6
const refuelRate = 0.5

@onready var train = get_parent() as Train

#------------Methods-------------#
func _ready():
	var root = get_tree().root.get_child(0)
	maxStashValue = 100
	currentStashValue = 100
	currentState = STATE.RUNNING
#TODO: FINISH
func interact(player):
	if player.getResource() != 2:
		return
	if currentState == STATE.RUNNING:
		if (train.current_speed + refuelRate) <= maxSpeed:
			train.current_speed += refuelRate
			player.clearInventory()
		if train.current_speed >= maxSpeed:
				train.current_speed = maxSpeed
				
		return




func _process(delta):
	if not train.is_dead():
		train.current_speed -= 0.1 * delta
		print(train.current_speed)
		
	

