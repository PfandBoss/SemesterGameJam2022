extends CharacterBody3D

#-----------Parameters--------------#
var SPEED = 10
var movement = Vector3(0,0,0)
var inventory = 0 #1 - full, 0 - empty inventory
var resource = 0 

var is_alive = true
@onready var is_player1 = true

var walking
var idle

enum TYPE {AMMO, GUNPOWDER, FUEL}

#---------------Methods--------------#
func _ready():
	walking = "walking"
	idle = "idle"

func _physics_process(delta):
	if(velocity.length() > 0):
		$AnimatedSprite3D.play(walking)
	else:
		$AnimatedSprite3D.play(idle)
	
	movement = Vector3(0,0,0)
	check_interaction()
	check_input()
	velocity = movement * SPEED
	if velocity.x < 0:
		$AnimatedSprite3D.rotation.y = deg_to_rad(90)
	if velocity.x > 0:
		$AnimatedSprite3D.rotation.y = deg_to_rad(-90)
	if velocity.z > 0:
		$AnimatedSprite3D.rotation.y = deg_to_rad(-180)
	if velocity.z < 0:
		$AnimatedSprite3D.rotation.y = deg_to_rad(0)
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
					body.interact(self)
				elif inventory && not body is Storage:
					body.interact(self)
	
func fill_inventory(type):
	self.inventory = 1
	self.resource = type
	match self.resource:
		0:
			walking = "walking_ball"
			idle = "idle_ball"
		1:
			walking = "walking_powder"
			idle = "idle_powder"
		2:
			walking = "walking_coal"
			idle = "idle_coal"
