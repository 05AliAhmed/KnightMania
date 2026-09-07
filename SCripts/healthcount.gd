extends Label

@onready var lives: Label = $"."



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lives.text = str(gamemanager.currenthealth)
	
