extends Control

var currentSpeed
var maxSpeed = float(TrainEngine.maxSpeed)
var minSpeed = 0.0

var deg
var rad

var player

@onready var root = self.get_parent()
#acceptable rotations range from -35 to +35 degrees
func _ready():
	
	player = root.player_id
	
	#get Game Node reference
	while not root is Game:
		root = root.get_parent()
		
func _process(_delta):
	
	if player == 1:
		currentSpeed = root.p1_train.current_speed
	else:
		currentSpeed = root.p2_train.current_speed
		
	deg = currentSpeed * (70.0/maxSpeed) - 35.0
	rad = (deg * 3.14) / 180
	self.get_node("Pfeil").rotation = rad
