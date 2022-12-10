extends Node

#Signals
signal ammo_pickup
signal shoot

var t = 0.0
@onready var tween = create_tween() as Tween
@onready var p1 = $Player1Path/PathFollow3D
@onready var p2 = $Player2Path/PathFollow3D


func _ready():
	start_tween()

func start_tween():
	tween.set_trans(Tween.TRANS_LINEAR)	
	tween.set_parallel(true)
	tween.tween_property(p1, "progress_ratio", 1, 5)
	tween.tween_property(p2, "progress_ratio", -1, 5)
	
func _process(delta):
	if round(p1.position.distance_to(p2.position)) == 9:
		emit_signal("shoot")


	
