extends Node2D
@onready var game_timer: Node2D = $GameTimer

var buttons_pressed = 0
var timer_end = false
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await game_timer.Timer(7.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if finished:
		return
		
	if buttons_pressed == 6:
		finished = true
		Global.win_minigame()
	elif timer_end:
		finished = true
		Global.lose_life()
