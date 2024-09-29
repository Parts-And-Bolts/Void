class_name Enemy
extends CharacterBody2D
@onready var right: RayCast2D = $Right
@onready var left: RayCast2D = $Left
@onready var sprite: AnimatedSprite2D = $Sprite


const SPEED = 100
const JUMP_VELOCITY = -250.0

var hasJumped = false
var direction = 1
var sprites: Array[Resource]
func _ready():
	
	for filePath in DirAccess.get_files_at("res://Resources/Spriteframes/"):
		
		if filePath.get_extension() == "tres":
			sprites.append(load("res://Resources/Spriteframes/" + filePath))
	
	sprite.sprite_frames = sprites.pick_random()
	sprite.play("idle")
@onready var power_down: AudioStreamPlayer2D = $"Sounds/Power-down"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if right.is_colliding() :
		direction = -1
	elif left.is_colliding():
		direction = 1
	
	if right.get_collider() is Player:
		if PlayerData.isRecharging == false:
			PlayerData.batteryLevel = 1
			power_down.play()
	elif left.get_collider() is Player:
		if PlayerData.isRecharging == false:
			PlayerData.batteryLevel = 1
			power_down.play()
	
	if randi_range(1,300) == 1 and not hasJumped and is_on_floor():
		hasJumped = true
		velocity.y = JUMP_VELOCITY
	
	if hasJumped and is_on_floor():
		hasJumped = false
		
	if not hasJumped and not is_on_floor():
		hasJumped = true
		if randi_range(1,2) ==1:
			velocity.y = JUMP_VELOCITY
	if not $Sounds/Walk.playing and is_on_floor():
		$Sounds/Walk.play()
	if not is_on_floor():
		if $Sounds/Walk.playing:
			$Sounds/Walk.stop()
	sprite.play("walk")
	sprite.flip_h = (direction == -1)
	
	velocity.x = direction * SPEED
	

	move_and_slide()
