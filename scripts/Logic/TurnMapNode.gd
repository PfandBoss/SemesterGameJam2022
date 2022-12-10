extends StraightMapNode
class_name TurnMapNode

signal turnEvent

var turn = false
@export var is_left_turn = false
@export var turn_node : MapNode

func _on_train_entered(train):
	super._on_train_entered(train)
	turnEvent.emit()

func _on_train_exit(train):
	if(turn):
		turn_node._on_train_entered(train)
		current_trains.erase(train)
		return turn_node
	else:
		super._on_train_exit(train)
		return next
