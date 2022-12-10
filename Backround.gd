extends Node


const pre_background_straight = preload("res://background_straight.tscn")
const pre_background_left = preload("res://Backround.gd")
const pre_background_right = preload("res://Backround.gd")

var background_straight
var background_left
var background_right

var level


func _ready():
	level = get_node("game")
	background_straight = pre_background_straight.instance()
	background_left = pre_background_left.instance()
	background_right = pre_background_right.instance()
	add_straight()



func add_straight():
	var single_straight = background_straight.get_child("straight").dublicate()
	level.add_child(single_straight)
