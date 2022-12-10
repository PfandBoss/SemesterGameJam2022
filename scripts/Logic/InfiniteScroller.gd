extends Node3D

@onready var rails = preload("res://Nodes/rail_tracks.tscn")
@onready var container = $Container
# Called when the node enters the scene tree for the first time
var offset = -13
var last_obj
func _ready():
	var obj = rails.instantiate() as Node3D
	#obj.position = position
	add_child(obj)
	obj.position = Vector3.ZERO
	last_obj = obj
	
	var timer = Timer.new()
	self.add_child(timer)
	timer.timeout.connect(create_rail)
	timer.set_wait_time(0.2)
	timer.start()

func create_rail():
	var obj = rails.instantiate()
	#obj.position = position
	obj.position.z = last_obj.position.z + offset
	add_child(obj)
	last_obj = obj
