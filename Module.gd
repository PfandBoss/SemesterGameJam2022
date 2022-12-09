extends Node

class_name Module
#-----------Parameters----------------'
var currentStashValue  = 0 : set = _set_currentStashValue, get = _get_currentStashValue

var maxStashValue  = 0 : set = _set_maxStashValue, get = _get_maxStashValue

var currentState = null : set = _set_state, get = _get_state

var level = 0 : set = _set_level, get = _get_level


enum MODULE_TYPE {CANNON, STEERING, ENGINE, STORAGE}



#------------Methods-------------#


func interact():
	pass




#-----------Setter and Getter---------------#
func _set_currentStashValue(newValue):
	currentStashValue = newValue
func _get_currentStashValue():
	return currentStashValue
func _set_maxStashValue(newValue):
	currentStashValue = newValue
func _get_maxStashValue():
	return currentStashValue
func _set_level(newValue):
	level = newValue
func _get_level():
	return level
func _set_state(newValue):
	currentState = newValue
func _get_state():
	return currentState
