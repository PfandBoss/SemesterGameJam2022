extends Control

var master_bus

# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus() # Replace with function body.
	master_bus = AudioServer.get_bus_index("Master")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Nodes/game.tscn")
# Replace with function body.


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Nodes/game.tscn") # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()



func _on_full_screen_pressed():
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		else:
			if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_WINDOWED:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		


func _on_vol_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
