extends Area2D

@onready var timer: Timer = $Timer
#@onready var game_manager: Node = %GameManager
#@onready var heart_container = $CanvasLayer/HeartContainer
@onready var damage_sfx = $"Damage Sfx"
#var currenthealth = 3
@onready var lives = $CanvasLayer/Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#var checkpoint_manager
#var player
#var label_value: String;
#var has_died

#func _ready() -> void:
	#checkpoint_manager = get_parent().get_node("Checkpoint_Manager")
	#player = get_parent().get_node("PLayer")


#func _process(delta: float) -> void:
	#lives.text = " HP : " + str(currenthealth) 
	
	
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		
		gamemanager.health_sys()
		#PLayer.has_died = true
		damage_sfx.play()
		print("You Died")
		timer.start()
		
		
		#var label_value: int = int(lives.text)
		#
		#label_value -= 1
		#lives.text = str(label_value)
		#print("test", label_value)
		#has_died = true
		#health_sys()
		#gamemanager.health_sys()
		#animated_sprite_2d.play("Death")
		
	
func _on_timer_timeout() -> void:
	#if gamemanager.currenthealth == 0:
		get_tree().reload_current_scene()
	
#func health_sys():
	#
	#currenthealth -= 1
	#lives.text = str(currenthealth) 
	#print(currenthealth)
#
#func level_reload
 #if level = 1
 #get_tree().change_scn_to_file(Level 2)
 #if level = 2
 #get_tree().change_scn_to_file(main menu)
