class_name Player
extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $Sprite

var currentInteractable: InteractableObject2D

@onready var sounds: Node = $Sounds


var sprites: Array

const SPEED = 100
const JUMP_VELOCITY = -250.0




func _ready():
	
	for filePath in DirAccess.get_files_at("res://Resources/Spriteframes/"):
		
		if filePath.get_extension() == "tres":
			sprites.append(load("res://Resources/Spriteframes/" + filePath))
	
	sprite.sprite_frames = sprites.pick_random()
	sprite.play("idle")
	
var out = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		out = true
		velocity += get_gravity() * delta
	else:
		if out == true:
			out = false
			$Sounds/Fall.play()
	PlayerData.canJump = (get_gravity() != Vector2(0,0))
	
	if not PlayerData.isRecharging and PlayerData.canControl and PlayerData.gameStarted:
		# Handle jump.
		if currentInteractable:
			if Input.is_action_just_pressed(currentInteractable.action):
				currentInteractable.execute()
		
		if Input.is_action_pressed("jump") and is_on_floor() and PlayerData.canJump:
			$Sounds/Jump.play()
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("walk-left", "walk-right")
		if direction:
			
			if direction < 0:
				sprite.flip_h = true
			else:
				sprite.flip_h = false
			if not $Sounds/Walk.playing and is_on_floor():
				$Sounds/Walk.play()
				if not is_on_floor():
					if $Sounds/Walk.playing:
						$Sounds/Walk.stop()
			if sprite.animation == "idle":
				
				sprite.play("walk")
			velocity.x = direction * SPEED
		else:
			sprite.play("idle")
			if $Sounds/Walk.playing:
				$Sounds/Walk.stop()
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		if $Sounds/Walk.playing:
			$Sounds/Walk.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite.play("idle")
	move_and_slide()


func _on_drainage_timer_timeout() -> void:
	if PlayerData.isRecharging == false and PlayerData.canControl and PlayerData.gameStarted:
		PlayerData.batteryLevel -= 1
		if PlayerData.batteryLevel == 0:
			PlayerData.isRecharging = true


func _on_recharge_timer_timeout() -> void:
	if PlayerData.isRecharging == true and PlayerData.canControl:
		PlayerData.batteryLevel += 1
		recharging.visible = true
		if PlayerData.batteryLevel == 100:
			recharging.visible = false
			PlayerData.isRecharging = false


func _on_normal_timer_timeout() -> void:
	if PlayerData.gameStarted:
		PlayerData.timeLeft -= 1
		if PlayerData.timeLeft == -1:
			OutOfTime.visible = true
			PlayerData.canControl = false
			OutOfTime.get_node("Control/ran-out").play()
			await get_tree().create_timer(4).timeout
			PlayerData.setDefaults()
			get_tree().reload_current_scene()
