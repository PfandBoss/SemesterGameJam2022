extends CanvasLayer

var currentSpeed

var maxSpeed = float(TrainEngine.maxSpeed)
var minSpeed = 0.0

var deg
var rad

@onready var root = self.get_parent()

func _ready():
	#get Game Node reference
	while not root is Game:
		root = root.get_parent()
	
	print(root.name)
	print(maxSpeed)
		
#acceptable rotations range from -35 to +35 degrees
func _process(delta):
	
	currentSpeed = root.p1_train.current_speed
	deg = ((70.0/maxSpeed)* currentSpeed) - 35.0
	rad = (deg * 3.14)/180.0
	self.get_node("Pfeil").rotation = rad

func round_to_digit(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
