class_name RoomFocus
extends Area2D

@export var camera: Camera2D




func _on_body_entered(_body: Node2D) -> void:
	camera.enabled = true


func _on_body_exited(_body: Node2D) -> void:
	camera.enabled = false
