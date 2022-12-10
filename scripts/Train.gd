extends Node
class_name Train

signal hit(player, dmg)
signal game_over

var is_P1 = true
var current_speed = 10
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
			print("Shot P2")

func is_dead():
	if current_speed <= 0:
		game_over.emit()
	
