extends Node2D
@onready var game_timer: Node2D = $GameTimer

var falling_object_scene = preload("res://Scenes/falling_object.tscn")

var timer_end = false
var hit = false
var finished = false

func _ready() -> void:
	await game_timer.Timer(7.0)
	timer_end = true


func _process(delta: float) -> void:
	if finished:
		return
	
	if hit:
		finished = true
		Global.lose_life()
	elif timer_end:
		finished = true
		Global.win_minigame()


func _on_spawn_timer_timeout() -> void:
	if finished:
		return
	var obj = falling_object_scene.instantiate()
	obj.position = Vector2(randf_range(50, get_viewport_rect().size.x - 50), -50)
	obj.hit_player.connect(_on_player_hit)
	add_child(obj)


func _on_player_hit() -> void:
	hit = true
