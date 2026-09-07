extends Area2D

@onready var timer: Timer = $Timer

@onready var final_text: Label = $"../PLayer/Final-text"




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		print("Finally I have it the Eternal Flame Sword!!")
		final_text.text = "Finally I have it \n The Eternal Flame Sword!!"
		timer.start()
		


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scns/Mainmenu.tscn")
