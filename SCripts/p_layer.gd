extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var Velocity = Vector2()
@onready var running_sfx = $"Running sfx"
@onready var animations = $AnimatedSprite2D
@onready var jump_sfx = $JumpSfx
#@onready var damage = $Damage
#var has_died = false
#var damage

#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
#
#var test = 50

#@onready var damage_script = get_node("/root/Bgm")

func _ready() -> void:

	add_to_group("Enemies")
	#damage = get_parent().get_node("Damage")

func _updateAnimation():
	if velocity.length() == 0:
		animations.play("IDle")
	if velocity.x > 0 and is_on_floor():
		animations.play("Running")
		animations.flip_h = false
	if velocity.x < 0 and is_on_floor():
		animations.flip_h = true
		animations.play("Running")
		
	#if has_died == true:
		#animations.play("Death")
	#if damage.has_died == true:
		#print("died already")
		#animations.play("Death")
		#print("animation palyed")

func updateSFX():
	if Input.is_action_just_pressed("MoveRight") || Input.is_action_just_pressed("MoveLeft"): 
		running_sfx.play()
	elif Input.is_action_just_released("MoveRight") || Input.is_action_just_released("MoveLeft"):
		running_sfx.stop()

	
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#if Input.is_action_just_pressed("Jump") and Input.is_action_pressed("MoveLeft") :
			#animations.play("Jump")
		#elif Input.is_action_just_pressed("Jump") and Input.is_action_pressed("MoveRight"):
			#animations.play("Jump")
#		It was not working with this previouse code where normal jump was brfore and then it was left 
#jump . The prob was that it was checking if jump is pressed frist which was true so code did not check 
#further conditions. but when written upside dow it first checked the condition for jump left which was 
#not true so it moved on to chechk further condition of checking jump pressed or not.
		#elif Input.is_action_just_pressed("Jump"): 
		animations.play("Jump")
		jump_sfx.play()
		

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		velocity.x = direction * SPEED
		#running_sfx.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()
	_updateAnimation()
	updateSFX()
