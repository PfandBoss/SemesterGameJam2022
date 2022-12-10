extends Node

#Signals
signal ammo_pickup
signal shoot

var t = 0.0

@onready var tween = create_tween() as Tween

@onready var p1 = $Player1Path/PathFollow3D
@onready var p2 = $Player2Path/PathFollow3D

var speed_p1 = 10
var speed_p2 = 10

func _ready():
	p1.get_node("root").test.connect(func(): print("player1"))
	p2.get_node("root").test.connect(func(): print("player2"))
	start_tween()

func start_tween():
	tween.stop()
	tween = create_tween()
	tween.set_parallel()
	tween.set_trans(Tween.TRANS_LINEAR)	
	tween.tween_property(p1, "progress_ratio", 1, speed_p1)
	tween.tween_property(p2, "progress_ratio", -1, speed_p2)


	
func _process(delta):
	if Input.is_action_pressed("test"):
		speed_p1 = 5
		start_tween()
	
	if round(p1.position.distance_to(p2.position)) == 9:
		emit_signal("shoot")


	
