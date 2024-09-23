class_name InteractableObject2D
extends Area2D

@export_node_path("Node") var objectPath
@export var action: String

var isInside = false
var isPressed = false

func execute():
	if isInside and not isPressed:
		var object: AnimationPlayer = get_node(objectPath)
		object.play("main")

func _on_body_entered(body: Node2D) -> void:
	
	if body is Player:
		
		body.currentInteractable = self
		isInside = true


func _on_body_exited(body: Node2D) -> void:
	
	if body is Player:
		
		if body.currentInteractable == self:
			body.currentInteractable = null
		isInside = false
