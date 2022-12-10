extends Node
class_name Game

#Signals
signal ammo_pickup
signal shoot

var t = 0.0

@onready var p1_train = $Player1 as Train
@onready var p2_train = $Player2 as Train



func _ready():
	p2_train.get_node("CharacterBody3D").is_player1 = false
	p2_train.is_P1 = false
	p1_train.hit.connect(_on_hit_player)
	

func _on_hit_player(player1,dmg):
	if not player1:
		p2_train.current_speed -= dmg
	else:
		p1_train.current_speed -= dmg
	
func _process(delta):
	if Input.is_action_pressed("test"):
		emit_signal("shoot")
