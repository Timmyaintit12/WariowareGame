extends Node2D
@onready var game_timer: Node2D = $GameTimer

var mushrooms_collected = 0
var timer_end = false
var finished = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await game_timer.Timer(12.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if finished:
		return
		
	if mushrooms_collected == 6:
		finished = true
		Global.win_minigame()
			
	elif timer_end:
		finished = true
		Global.lose_life()

func _on_mushroom_mushroom_collected() -> void:
	mushrooms_collected = mushrooms_collected +1
	print("Mushroom collected")
