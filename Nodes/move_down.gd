extends Node3D
var t = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta * 45
	position.z = t
	
	if(position.z > 250):
		queue_free()
