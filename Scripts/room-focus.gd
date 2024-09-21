class_name RoomFocus
extends Area2D

@export var camera: Camera2D
@onready var start: Marker2D = $"../.."




func _on_body_entered(_body: Node2D) -> void:
	if get_tree().current_scene.find_child("CanvasLayer"):
		var ui: UI = get_tree().current_scene.get_node("CanvasLayer").get_node("UI")
		ui.on_change_message.call_deferred(start.get_name())
	camera.enabled = true


func _on_body_exited(_body: Node2D) -> void:
	camera.enabled = false
