extends Node
class_name Train

signal hit(player, dmg)
signal game_over

var is_P1 = true
var current_distance = 0
var distance_from_start = 0
var current_speed = 5
var CANNONS = []
var STORAGES = []
#@onready var ENGINE = $Module/Engine

@onready var root = get_tree().root.get_child(0) as Game

func _ready():
	for child in get_children():
		if(child is Cannon):
			CANNONS.append(child)
		if(child is Storage):
			STORAGES.append(child)
	root.shoot.connect(_on_signal_shooting)


func _on_signal_shooting():
	for cannon in CANNONS:
		if cannon.shoot():
			hit.emit(is_P1,cannon.DAMAGE)

func is_dead():
	if current_speed <= 0:
		current_speed = 0
		game_over.emit()
		return true
	return false
	
func on_pickup(type, amount):
	for s in STORAGES:
		if s.currentType == type:
			if s.currentStashValue + amount <= s.maxStashValue:
				s.currentStashValue += amount
			else:
				s.currentStashValue = s.maxStashValue
			
			return
	

