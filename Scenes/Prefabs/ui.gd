class_name UI
extends Control


@onready var label: Label = $MarginContainer/Label

func on_change_message(room) -> void:
	
	label.text = "Room "+room
