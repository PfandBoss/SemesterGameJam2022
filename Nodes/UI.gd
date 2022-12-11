extends Control


func _on_button_pressed():
	print("HELLO")
	get_tree().change_scene_to_file("res://Nodes/game.tscn")


func _on_button_2_pressed():
	print("sddssds")
	get_tree().change_scene_to_file("res://menu/main_menu.tscn")
