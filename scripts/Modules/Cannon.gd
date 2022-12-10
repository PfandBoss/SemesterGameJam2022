extends Module

class_name Cannon

enum STATE {INACTIVE, RELOADING, SHOOTING}
var currentPowderStashValue = 0
var maxPowderStashValue = 3
var CAN_ENGAGE = false
var DAMAGE = 5
var ammoType = -1
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
				ammoType = 0
				player.clearInventory()
				$AudioStreamPlayer2.play()
			return
		
		if player.getResource() == 1:
			if currentPowderStashValue < maxPowderStashValue:
				currentPowderStashValue += 1
				player.clearInventory()
				$AudioStreamPlayer2.play()
			return
		
		if player.getResource() == 3:
			if currentStashValue < maxStashValue:
				currentStashValue += 1
				ammoType = 1
				player.clearInventory()
				$AudioStreamPlayer2.play()
			return
			
		if player.getResource() == 4:
			if currentStashValue < maxStashValue:
				currentStashValue += 1
				ammoType = 2
				player.clearInventory()
				$AudioStreamPlayer2.play()
			return

func shoot():
	if currentStashValue >= 1 and currentPowderStashValue >= 1 and currentState == STATE.INACTIVE and ammoType == 0:
		currentState = STATE.SHOOTING
		currentStashValue -= 1
		currentPowderStashValue = 0
		currentState = STATE.INACTIVE
		$AudioStreamPlayer.play(0)
		return true
	
	if currentStashValue >= 1 and currentPowderStashValue >= 2 and currentState == STATE.INACTIVE and ammoType == 1:
		currentState = STATE.SHOOTING
		currentStashValue -= 1
		currentPowderStashValue = 0
		currentState = STATE.INACTIVE
		$AudioStreamPlayer.play(0)
		return true
		
	if currentStashValue >= 1 and currentPowderStashValue >= 3 and currentState == STATE.INACTIVE and ammoType == 2:
		currentState = STATE.SHOOTING
		currentStashValue -= 1
		currentPowderStashValue = 0
		currentState = STATE.INACTIVE
		$AudioStreamPlayer.play(0)
		return true
	return false
