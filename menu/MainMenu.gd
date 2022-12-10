extends Control


# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_pressed():
	get_tree().change_scene("res://pathTo/Level.tscn") # Replace with function body.


func _on_tutorial_pressed():
	get_tree().change_scene("res://pathTo/Level.tscn") # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()

