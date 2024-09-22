class_name Player
extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $Sprite

var currentInteractable: InteractableObject2D

var sprites: Array

const SPEED = 100
const JUMP_VELOCITY = -250.0

func _ready():
	
	for filePath in DirAccess.get_files_at("res://Resources/Spriteframes/"):
		
		if filePath.get_extension() == "tres":
			sprites.append(load("res://Resources/Spriteframes/" + filePath))
	
	sprite.sprite_frames = sprites.pick_random()
	sprite.play("idle")
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	PlayerData.canJump = (get_gravity() == Vector2(0,0))
	# Handle jump.
	if currentInteractable:
		if Input.is_action_just_pressed(currentInteractable.action):
			currentInteractable.execute()
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and PlayerData.canJump:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		
		if direction < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		
		if sprite.animation == "idle":
			sprite.play("walk")
		velocity.x = direction * SPEED
	else:
		sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
