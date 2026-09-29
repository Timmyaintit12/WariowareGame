extends Node

var minigames_done = 0
var lives = 5
var total_minigames = 3


func reset() -> void:
	lives = 5
	minigames_done = 0


func win_minigame() -> void:
	minigames_done += 1
	if minigames_done >= total_minigames:
		get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")

func lose_life() -> void:
	lives -= 1
	if lives <= 0:
		get_tree().change_scene_to_file("res://Scenes/loss_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
