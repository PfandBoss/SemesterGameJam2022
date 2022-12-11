extends Node3D

func _ready():
	self.get_node("play").hide()

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	self.scale = Vector3(1.5,1.5,1.5)
	self.get_node("play").show()
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print("Start Game")
			get_tree().change_scene_to_file("res://Nodes/game.tscn")
	


func _on_area_3d_mouse_exited():
	self.get_node("play").hide()
	self.scale = Vector3(1,1,1)
