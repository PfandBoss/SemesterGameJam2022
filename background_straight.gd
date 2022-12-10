extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	tween.tween_property(self,"position",Vector3(-8,0,40),5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
