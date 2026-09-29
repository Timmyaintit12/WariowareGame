extends Node2D

func _on_button_pressed() -> void:
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
