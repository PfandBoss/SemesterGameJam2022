extends Control

func _ready():
	var gui = self.get_node("Speedometer_player1")
	for body in gui.get_children():
		body.anchors_preset = CORNER_TOP_RIGHT
