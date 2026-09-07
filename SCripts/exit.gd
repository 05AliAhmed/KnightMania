extends Area2D

#var level_count = 0
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		print("bye")
		#level_count = level_count
		#print(level_count)
		timer.start()
		#level_count += 1
	
#func _process(delta: float) -> void:
	#level_count = level_count
	#print(level_count)
		


func _on_timer_timeout() -> void:
		#if level_count == 1:
			get_tree().change_scene_to_file("res://Scns/level_2.tscn")
			#level_count -= 1 
			###level_count = 2
			#print(level_count)
		#if level_count == 2:
			#get_tree().change_scene_to_file("res://Scns/Mainmenu.tscn")
			
	
