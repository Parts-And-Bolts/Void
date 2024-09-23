class_name Pushable
extends Area2D

##Self Explanatory, duh
@export var pushForce = 500



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		PlayerData.canControl = false
		if body.get_node("Sprite").flip_h == false:
			body.velocity = Vector2(-pushForce,100)
		else:
			body.velocity = Vector2(pushForce,100)
		body.move_and_slide()
		await get_tree().create_timer(0.05).timeout
		body.velocity = Vector2(0,0)
		
		PlayerData.canControl = true
