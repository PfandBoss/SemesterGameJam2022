extends CanvasLayer

var currentSpeed
var maxSpeed = float(TrainEngine.maxSpeed)
var minSpeed = 0.0

var deg
var rad

@onready var root = self.get_parent()
#acceptable rotations range from -35 to +35 degrees
func _ready():
	#get Game Node reference
	while not root is Game:
		root = root.get_parent()
	
	print("maxSpeed =", maxSpeed)
		
func _process(delta):
	
	currentSpeed = root.p1_train.current_speed
	print("currentSpeed", currentSpeed)
	deg = currentSpeed * (70.0/maxSpeed) - 35.0
	print(deg)
	rad = (deg * 3.14) / 180
	self.get_node("Pfeil").rotation = rad

