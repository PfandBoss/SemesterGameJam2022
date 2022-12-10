extends Node

signal test

var speed = 10
var CANNONS = []
var STORAGES = []
#@onready var ENGINE = $Module/Engine

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	test.emit() # Replace with function body.
