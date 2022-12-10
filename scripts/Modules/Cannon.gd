extends Module

class_name Cannon

enum STATE {INACTIVE, RELOADING, SHOOTING}
enum AMMO {NORMAL, HEAVY, LIGHT}
var currentAmmo: AMMO
var CAN_ENGAGE = true
var DAMAGE = 5
@onready var train = get_parent() as Train

#------------Methods-------------#
func _ready():
	maxStashValue = 1
	currentStashValue = 1
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

func shoot():
	if not CAN_ENGAGE:
		return false
	CAN_ENGAGE = false
	create_tween().tween_callback(func(): CAN_ENGAGE = true).set_delay(2)
	
	if currentStashValue >= 1 and currentState == STATE.INACTIVE:
		currentState = STATE.SHOOTING
		currentStashValue -= 1
		currentState = STATE.INACTIVE
		return true
	return false
