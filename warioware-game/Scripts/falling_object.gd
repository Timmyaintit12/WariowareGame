extends Area2D

signal hit_player

var speed = randf_range(250.0, 450.0)

func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		hit_player.emit()
