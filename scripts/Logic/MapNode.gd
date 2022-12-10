extends Node
class_name MapNode

const LENGTH = 10
const PICKUP = 0
var previous : MapNode

var current_trains = []

func _on_train_entered(train):
	current_trains.append(train)
	
func _on_train_exit(train):
	current_trains.erase(train)
