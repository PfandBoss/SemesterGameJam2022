extends Node
class_name MapNode

const LENGTH = 10
const PICKUP = 0

const NONE = 0
const COAL = 1
const GUNPOWDER = 2
const CANNONBALL_LIGHT = 3

var previous : MapNode

var current_trains = []
var current_pickup = NONE

func _on_train_entered(train):
	current_trains.append(train)
	
func _on_train_exit(train):
	current_trains.erase(train)
