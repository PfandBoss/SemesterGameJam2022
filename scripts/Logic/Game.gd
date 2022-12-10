extends Node
class_name Game

const CHILL = 0
const FIGHTING = 1


#Signals
signal ammo_pickup
signal shoot

var fight_state = CHILL

var t = 0.0

@onready var p1_train = $Player1 as Train
@onready var p2_train = $Player2 as Train

@onready var StartNode = $StartNode
var p1_node : MapNode
var p2_node : MapNode

var initial_pos_p1 : Vector3
var initial_pos_p2 : Vector3

func _ready():
	initial_pos_p1 = p1_train.position
	initial_pos_p2 = p2_train.position
	p1_node = StartNode
	p2_node = StartNode
	p2_train.get_node("CharacterBody3D").is_player1 = false
	p2_train.is_P1 = false
	p1_train.current_speed = 5
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

	if(p1_node == p2_node && p1_train.current_distance - p2_train.current_distance < 2):
		if(fight_state == CHILL):
			fight_state = FIGHTING
			var tween = create_tween()
			tween.set_trans(Tween.TRANS_EXPO)
			tween.set_ease(Tween.EASE_OUT)
			var new_pos_p1 = p1_train.position + Vector3(-15,0,0)
			var new_pos_p2 = p2_train.position + Vector3(15,0,0)
			tween.tween_property($Camera3D, "position", Vector3(0,40,0), 1.4)
			tween.set_parallel()
			tween.tween_property(p1_train, "position",new_pos_p1, 1)
			tween.tween_property(p2_train, "position",new_pos_p2, 1)
			tween.tween_property($Control/Panel, "custom_minimum_size", Vector2(0,0), 1)
			
	elif(fight_state == FIGHTING):
		fight_state = CHILL
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_EXPO)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property($Camera3D, "position", Vector3(0,20,0), 1.4)
		tween.set_parallel()
		tween.tween_property(p1_train, "position",initial_pos_p1, 1)
		tween.tween_property(p2_train, "position", initial_pos_p2, 1)
		tween.tween_property($Control/Panel, "custom_minimum_size", Vector2(15,0), 1)
		
	if Input.is_action_pressed("test"):
		emit_signal("shoot")

	$Control/VSlider.value = p1_train.current_distance
	$Control/VSlider2.value = p2_train.current_distance
	
	
