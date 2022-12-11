extends Node3D

func _ready():
	self.get_node("settings").hide()
	self.get_node("volume").hide()

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	print("scale")
	self.get_node("settings").show()
	self.scale = Vector3(1.2,1.2,1.2)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print("Settings")
			#TODO: Settings:
			self.get_node("volume").show()
	


func _on_area_3d_mouse_exited():
	self.scale = Vector3(1,1,1)
	self.get_node("settings").hide()
	self.get_node("volume").hide()
