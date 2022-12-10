extends Node
class_name Game

#Signals
signal ammo_pickup
signal shoot

var t = 0.0

@onready var p1_train = $Player1 as Train
@onready var p2_train = $Player2 as Train

@onready var StartNode = $StartNode
var p1_node : MapNode
var p2_node : MapNode

func _ready():
	p1_node = StartNode
	p2_node = StartNode
	p2_train.get_node("CharacterBody3D").is_player1 = false
	p2_train.is_P1 = false
	p1_train.hit.connect(_on_hit_player)
	p2_train.hit.connect(_on_hit_player)
	

func _on_hit_player(player1,dmg):
	if not player1:
		p2_train.current_speed -= dmg
	else:
		p1_train.current_speed -= dmg
	
func _process(delta):
	p1_train.current_distance += p1_train.current_speed * delta
	p2_train.current_distance += p2_train.current_speed * delta
	
	if(p1_train.current_distance >= p1_node.LENGTH):
		var distance_delta = p1_train.current_distance - p1_node.LENGTH
		p1_node = p1_node._on_train_exit(p1_train)
		p1_train.current_distance = distance_delta
		
	if(p2_train.current_distance >= p2_node.LENGTH):
		var distance_delta = p2_train.current_distance - p2_node.LENGTH
		p2_node = p2_node._on_train_exit(p2_train)
		p2_train.current_distance = distance_delta

	
	if Input.is_action_pressed("test"):
		emit_signal("shoot")
