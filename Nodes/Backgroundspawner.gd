extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var background = preload("res://background_straight.tscn").instantiate()
	add_child(background)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
