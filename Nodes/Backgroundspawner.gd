extends Node3D

var background
# Called when the node enters the scene tree for the first time.
func _ready():
	background = preload("res://background_straight.tscn").instantiate()
	add_child(background)
	print(background.get_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(background.get_position())
