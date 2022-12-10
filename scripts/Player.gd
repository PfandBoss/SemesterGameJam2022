extends CharacterBody3D

#-----------Parameters--------------#
var SPEED = 10
var movement = Vector3(0,0,0)
var collisionLayer = 3
var inventory = 0 #1 - full, 0 - empty inventory
var resource = 0 

var is_alive = true
@onready var is_player1 = true

#---------------Methods--------------#
	
func _physics_process(delta):
	
	movement = Vector3(0,0,0)
	
	check_interaction()
	check_input()
	velocity = movement * SPEED
	move_and_slide()
	
func check_input():
	
	if is_player1:
		if Input.is_action_pressed("p1_left"):
			movement.x -= 1
		if Input.is_action_pressed("p1_right"):
			movement.x += 1
		if Input.is_action_pressed("p1_up"):
			movement.z -= 1
		if Input.is_action_pressed("p1_down"):
			movement.z += 1
	else:
		if Input.is_action_pressed("p2_left"):
			movement.x -= 1
		if Input.is_action_pressed("p2_right"):
			movement.x += 1
		if Input.is_action_pressed("p2_up"):
			movement.z -= 1
		if Input.is_action_pressed("p2_down"):
			movement.z += 1
		
func check_interaction():
	var action
	if is_player1:
		action = "p1_interact"
	else:
		action = "p2_interact"
		
	if Input.is_action_just_pressed(action):
		for body in $HitBox.get_overlapping_bodies():
			if body is Module:
				#Storage interaction
				if not inventory && body is Storage:
					body.interact()
				elif inventory && not body is Storage:
					body.interact()