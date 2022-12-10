extends Node3D

@onready var rails = preload("res://Assets/Model/Objects/rail_tracks.glb")
# Called when the node enters the scene tree for the first time
var offset = 0
func _ready():
	var timer = Timer.new()
	self.add_child(timer)
	timer.timeout.connect(create_rail)
	timer.set_wait_time(0.2)
	timer.start()

func create_rail():
	var obj = rails.instantiate()
	obj.rotation.y = deg_to_rad(90)
	obj.position = Vector3(0,0,13)
	offset -= 13
	add_child(obj)
	
	var timer = Timer.new()
	obj.add_child(timer)
# Connect the timer to make it call "queue_free" after two seconds
	timer.timeout.connect(obj.queue_free)
	timer.set_wait_time(2)
	timer.start()

func _process(delta):
	position.z += delta * 40
