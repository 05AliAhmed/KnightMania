extends Node

var score = 0
var currenthealth = 3

@onready var Score = $Label

@onready var final_txt = $"Final txt"



func health_sys():
	currenthealth -= 1
	#healthcount.text = currenthealth
	print(currenthealth)
	if currenthealth < 1:
		print("Game over")
		get_tree().change_scene_to_file("res://Scns/game_over_scr.tscn")
		currenthealth = 3

func add_points():
	score += 1
	Score.text = "Congrats, 
				  You have successfully 
				  comeleted your quest. Your Reward 
				  is " + str(score) + "  $ Bitcoins"
