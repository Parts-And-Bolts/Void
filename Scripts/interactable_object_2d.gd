class_name InteractableDestroyObject2D
extends InteractableObject2D

func execute():
	
	if isInside and not isPressed:
		var object = get_node(objectPath)
		isPressed = true
		print(object.name)
		object.position = Vector2(-500,500)

func _on_body_entered(body: Node2D) -> void:
	
	if body is Player:
		print("yo")
		body.currentInteractable = self
		isInside = true


func _on_body_exited(body: Node2D) -> void:
	
	if body is Player:
		body.currentInteractable = null
		isInside = false
