extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player = $AnimationPlayer
@onready var coin_collect = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		game_manager.add_points()
		animation_player.play("Pickup")
		#queue_free()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		coin_collect.play()
		
