extends CharacterBody3D

class_name Player
#-----------Parameters--------------#
var SPEED = 10
var movement = Vector3(0,0,0)
var inventory = 0 #1 - full, 0 - empty inventory
var resource = 0 : get = getResource

var is_alive = true
@onready var is_player1 = true

var walking
var idle

enum TYPE {AMMO, GUNPOWDER, FUEL, LARGE, GIANT}

var P1inMiniGame = 0
var P2inMiniGame = 0
var MiniGame = [0, 0, 0]
var MiniGamePos = 0 
var rng = RandomNumberGenerator.new()
#---------------Methods--------------#
func _ready():
	walking = "walking"
	idle = "idle"
	$MiniGameButton0.hide()
	$MiniGameButton1.hide()
	$MiniGameButton2.hide()
	$MiniGameButton3.hide()
	$MiniGameButton4.hide()
	$MiniGameButton5.hide()
	#get_parent().find_child("CharacterBody3D").find_child("MiniGameButton0").hide() 
	#get_parent().find_child("CharacterBody3D").find_child("MiniGameButton1").hide()
	#get_parent().find_child("CharacterBody3D").find_child("MiniGameButton2").hide()

func miniGameColor(input: int, red: int):
	if(input == 0):
		$MiniGameButton0.modulate = Color(1,1,red)
	if(input == 1):
		$MiniGameButton1.modulate = Color(1,1,red)
	if(input == 2):
		$MiniGameButton2.modulate = Color(1,1,red)
	if(input == 3):
		$MiniGameButton3.modulate = Color(1,1,red)
	if(input == 4):
		$MiniGameButton4.modulate = Color(1,1,red)
	if(input == 5):
		$MiniGameButton5.modulate = Color(1,1,red)

func miniGameReset():
	MiniGamePos = 0
	if(is_player1):
		miniGameColor(0,1)
		miniGameColor(1,1)
		miniGameColor(2,1)
		MiniGame[0] = rng.randi_range(0, 3)
		miniGameSetArrow(0)
		MiniGame[1] = rng.randi_range(0, 3)
		miniGameSetArrow(1)
		MiniGame[2] = rng.randi_range(0, 3)
		miniGameSetArrow(2)
	else:
		miniGameColor(3,1)
		miniGameColor(4,1)
		miniGameColor(5,1)
		MiniGame[0] = rng.randi_range(0, 3)
		miniGameSetArrow(3)
		MiniGame[1] = rng.randi_range(0, 3)
		miniGameSetArrow(4)
		MiniGame[2] = rng.randi_range(0, 3)
		miniGameSetArrow(5)

func miniGameSetArrow(buttonNr: int):
	if(buttonNr == 0):
		$MiniGameButton0.frame = 26 + MiniGame[0]
	if(buttonNr == 1):
		$MiniGameButton1.frame = 26 + MiniGame[1]
	if(buttonNr == 2):
		$MiniGameButton2.frame = 26 + MiniGame[2]
	if(buttonNr == 3):
		$MiniGameButton3.frame = 26 + MiniGame[0]
	if(buttonNr == 4):
		$MiniGameButton4.frame = 26 + MiniGame[1]
	if(buttonNr == 5):
		$MiniGameButton5.frame = 26 + MiniGame[2]
	
func miniGameCheck(input : int):
	if(is_player1):
		if(input == MiniGame[MiniGamePos]):
			miniGameColor(MiniGamePos, 0)
			MiniGamePos = MiniGamePos +1
		else:
			miniGameReset()
		
		if(MiniGamePos >= 3):
			$MiniGameButton0.hide()
			$MiniGameButton1.hide()
			$MiniGameButton2.hide()
			P1inMiniGame = 0
			miniGameReset()
	else:
		if(input == MiniGame[MiniGamePos]):
			miniGameColor(MiniGamePos+3, 0)
			MiniGamePos = MiniGamePos +1
		else:
			miniGameReset()
		
		if(MiniGamePos >= 3):
			$MiniGameButton3.hide()
			$MiniGameButton4.hide()
			$MiniGameButton5.hide()
			P2inMiniGame = 0
			miniGameReset()
			
func _process(delta):
	if Input.is_action_just_pressed("p1_extra"):
		if(P1inMiniGame == 0):
			P1inMiniGame = 1
			$MiniGameButton0.show()
			$MiniGameButton1.show()
			$MiniGameButton2.show()
	
	if Input.is_action_just_pressed("p2_extra"):
		if(P2inMiniGame == 0):
			P2inMiniGame = 1
			$MiniGameButton3.show()
			$MiniGameButton4.show()
			$MiniGameButton5.show()

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
		if(!P1inMiniGame):
			if Input.is_action_pressed("p1_left"):
				movement.x -= 1
			if Input.is_action_pressed("p1_right"):
				movement.x += 1
			if Input.is_action_pressed("p1_up"):
				movement.z -= 1
			if Input.is_action_pressed("p1_down"):
				movement.z += 1
		else:
			if Input.is_action_just_pressed("p1_up"):
				miniGameCheck(0)
			if Input.is_action_just_pressed("p1_right"):
				miniGameCheck(1)
			if Input.is_action_just_pressed("p1_down"):
				miniGameCheck(2)
			if Input.is_action_just_pressed("p1_left"):
				miniGameCheck(3)
	else:
		if(!P2inMiniGame):
			if Input.is_action_pressed("p2_left"):
				movement.x -= 1
			if Input.is_action_pressed("p2_right"):
				movement.x += 1
			if Input.is_action_pressed("p2_up"):
				movement.z -= 1
			if Input.is_action_pressed("p2_down"):
				movement.z += 1
		else:
			if Input.is_action_just_pressed("p2_up"):
				miniGameCheck(0)
			if Input.is_action_just_pressed("p2_right"):
				miniGameCheck(1)
			if Input.is_action_just_pressed("p2_down"):
				miniGameCheck(2)
			if Input.is_action_just_pressed("p2_left"):
				miniGameCheck(3)
		
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
		3:
			walking = "walking_large"
			idle = "idle_large"
		4:
			walking = "walking_giant"
			idle = "idle_giant"


func getResource():
	return resource
	
func clearInventory():
	inventory = 0
	print("cleared")
	walking = "walking"
	idle = "idle"



