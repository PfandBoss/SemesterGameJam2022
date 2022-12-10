extends Module

class_name Cannon

enum STATE {INACTIVE, RELOADING, SHOOTING}
enum AMMO {NORMAL, HEAVY, LIGHT}
var currentAmmo: AMMO
var currentPowderStashValue = 0
var maxPowderStashValue = 3
var CAN_ENGAGE = false
var DAMAGE = 5
@onready var train = get_parent() as Train

#------------Methods-------------#
func _ready():
	maxStashValue = 1
	currentStashValue = 0
	currentState = STATE.INACTIVE
#TODO: FINISH
func interact(player):
	if currentState == STATE.INACTIVE:
		if player.getResource() == 0:
			if currentStashValue < maxStashValue:
				currentStashValue += 1
				player.clearInventory()
			return
		
		if player.getResource() == 1:
			if currentPowderStashValue < maxPowderStashValue:
				currentPowderStashValue += 1
				player.clearInventory()
			return
		return

func shoot():
	if currentStashValue >= 1 and currentPowderStashValue >= 1 and currentState == STATE.INACTIVE:
		currentState = STATE.SHOOTING
		currentStashValue -= 1
		currentPowderStashValue = 0
		currentState = STATE.INACTIVE
		print("pew")
		return true
	return false
