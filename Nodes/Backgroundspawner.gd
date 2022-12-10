extends Node3D

var background
# Called when the node enters the scene tree for the first time.
func _ready():
<<<<<<< HEAD
	var background = preload("res://background_straight.tscn").instantiate()
=======
	background = preload("res://background_straight.tscn").instantiate()
>>>>>>> 5f02f31566a22964a395c71a583c58c36f414be1
	add_child(background)
	print(background.get_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(background.get_position())
