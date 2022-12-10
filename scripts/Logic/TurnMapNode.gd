extends StraightMapNode

signal turnEvent

var is_left_turn = false
var turn = false
var turn_node : MapNode

func _on_train_entered(train):
	super._on_train_entered(train)
	turnEvent.emit()

func _on_train_exit(train):
	if(turn):
		turn_node._on_train_entered(train)
		current_trains.erase(train)
	else:
		super._on_train_exit(train)
