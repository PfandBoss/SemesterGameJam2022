extends Node
class_name Game

const CHILL = 0
const FIGHTING = 1


#Signals
signal ammo_pickup
signal shoot

var fight_state = CHILL

var t = 0.0

@onready var p1_train = $Train1 as Train
@onready var p2_train = $Train2 as Train

@onready var StartNode = $StartNode
var p1_node : MapNode
var p2_node : MapNode

var initial_pos_p1 : Vector3
var initial_pos_p2 : Vector3
var initial_camera_pos: Vector3

func _ready():
	initial_camera_pos = $Camera3D.position
	initial_pos_p1 = p1_train.position
	initial_pos_p2 = p2_train.position
	p1_node = StartNode
	p2_node = StartNode
	p2_train.get_node("CharacterBody3D").is_player1 = false
	p2_train.is_P1 = false
	p1_train.current_speed = 8
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
	p1_train.distance_from_start += p1_train.current_speed * delta
	p2_train.distance_from_start += p2_train.current_speed * delta
	
	if(p1_node == StartNode && p1_train.distance_from_start > 15):
		p1_train.distance_from_start = 0
	if(p2_node == StartNode && p2_train.distance_from_start > 15):
		p2_train.distance_from_start = 0
		
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
			var new_pos_p1 = p1_train.position + Vector3(-30,0,-15)
			var new_pos_p2 = p2_train.position + Vector3(30,0,-15)
			tween.tween_property($Camera3D, "position", initial_camera_pos + Vector3(0,80,20), 1.4)
			tween.set_parallel()
			tween.tween_property(p1_train, "position",new_pos_p1, 1)
			tween.tween_property(p2_train, "position",new_pos_p2, 1)
			tween.tween_property($Control/Panel, "custom_minimum_size", Vector2(0,0), 1)
			tween.tween_property($Control/VSlider,"scale",Vector2(0,0),1)
			tween.tween_property($Control/VSlider2,"scale",Vector2(0,0),1)
			p1_train.current_speed *= 0.5
			p2_train.current_speed *= 0.5

			
			
	elif(fight_state == FIGHTING):
		fight_state = CHILL
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_EXPO)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property($Camera3D, "position", initial_camera_pos, 1.4)
		tween.set_parallel()
		tween.tween_property(p1_train, "position",initial_pos_p1, 1)
		tween.tween_property(p2_train, "position", initial_pos_p2, 1)
		tween.tween_property($Control/Panel, "custom_minimum_size", Vector2(15,0), 1)
		tween.tween_property($Control/VSlider,"scale",Vector2(1,1),1)
		tween.tween_property($Control/VSlider2,"scale",Vector2(1,1),1)
		p1_train.current_speed *= 2
		p2_train.current_speed *= 2
		
		
	if Input.is_action_pressed("test"):
		emit_signal("shoot")
	

	$Control/VSlider.value = p1_train.distance_from_start
	$Control/VSlider2.value = p2_train.distance_from_start
	
