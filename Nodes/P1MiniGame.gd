extends Node

#-----------Parameters--------------#

var P1inMiniGame = 0
var MiniGame = [0, 0, 0]
var MiniGamePos = 0 
var rng = RandomNumberGenerator.new()
#---------------Methods--------------#
func _ready():
	get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton0").hide() 
	get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton1").hide()
	get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton2").hide()

func miniGameColor(input: int, red: int):
	if(input == 0):
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton0").modulate = Color(1,1,red)
	if(input == 1):
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton1").modulate = Color(1,1,red)
	if(input == 2):
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton2").modulate = Color(1,1,red)

func miniGameReset():
	MiniGamePos = 0
	miniGameColor(0,1)
	miniGameColor(1,1)
	miniGameColor(2,1)
	MiniGame[0] = rng.randi_range(0, 3)
	miniGameSetArrow(0)
	MiniGame[1] = rng.randi_range(0, 3)
	miniGameSetArrow(1)
	MiniGame[2] = rng.randi_range(0, 3)
	miniGameSetArrow(2)

func miniGameSetArrow(buttonNr: int):
	if(buttonNr == 0):
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton0").frame = 26 + MiniGame[0]
		#$MiniGameButton0.frame = 26 + MiniGame[0]
	if(buttonNr == 1):
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton1").frame = 26 + MiniGame[1]
		#$MiniGameButton1.frame = 26 + MiniGame[1]
	if(buttonNr == 2):
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton2").frame = 26 + MiniGame[2]
		#$MiniGameButton2.frame = 26 + MiniGame[2]
	
func miniGameCheck(input : int):
	if(input == MiniGame[MiniGamePos]):
		miniGameColor(MiniGamePos, 0)
		MiniGamePos = MiniGamePos +1
	else:
		miniGameReset()
	
	if(MiniGamePos >= 3):
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton0").hide()
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton1").hide()
		get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton2").hide()
		P1inMiniGame = 0
		get_parent().P1inMiniGame = 0
		miniGameReset()
	
func _process(delta):
	if Input.is_action_just_pressed("p1_extra"):
		if(P1inMiniGame == 0):
			P1inMiniGame = 1
			get_parent().P1inMiniGame = 1
			get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton0").show()
			get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton1").show()
			get_parent().get_parent().find_child("CharacterBody3D").find_child("MiniGameButton2").show()

func check_input():
		if(P1inMiniGame):
			if Input.is_action_just_pressed("p1_up"):
				miniGameCheck(0)
			if Input.is_action_just_pressed("p1_right"):
				miniGameCheck(1)
			if Input.is_action_just_pressed("p1_down"):
				miniGameCheck(2)
			if Input.is_action_just_pressed("p1_left"):
				miniGameCheck(3)

		
