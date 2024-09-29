class_name RoomFocus
extends Area2D

@export_node_path("Camera2D") var cameraPath: NodePath



@onready var start: Marker2D = $"../.."





func _on_body_entered(body: Node2D) -> void:
	var camera = get_node(cameraPath)
	if body is Player:
		if get_tree().current_scene.find_child("CanvasLayer"):
			var ui: UI = get_tree().current_scene.get_node("CanvasLayer").get_node("UI")
			ui.on_change_message.call_deferred(start.get_name())
		camera.enabled = true
	
	


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		var camera = get_node(cameraPath)
		camera.enabled = false
