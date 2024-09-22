class_name InteractableDestroyObject2D
extends InteractableObject2D

func execute():
	
	if isInside and not isPressed:
		var object = get_node(objectPath)
		isPressed = true
		
		object.queue_free()

func _on_body_entered(body: Node2D) -> void:
	
	if body is Player:
		
		body.currentInteractable = self
		isInside = true


func _on_body_exited(body: Node2D) -> void:
	
	if body is Player:
		
		if body.currentInteractable == self:
			body.currentInteractable = null
		isInside = false
