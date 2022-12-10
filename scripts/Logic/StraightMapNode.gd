extends MapNode
class_name StraightMapNode

var next : MapNode

func _on_train_exit(train):
	next._on_train_entered(train)
	super._on_train_exit(train)
