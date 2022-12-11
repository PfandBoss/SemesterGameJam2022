extends Node3D




 


var speed := 2.0

func _process(delta):
	rotate(Vector3(0,1,0),delta * speed)
	print(rotation.y)
