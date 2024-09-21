class_name RoomGeneration
extends Node2D

##How Many rooms To Generate
@export var roomsToGenerate = 10
var Rooms: Array[Resource]

var room = 1
@onready var LastRoom = $Start

func _ready():
	
	for filePath in DirAccess.get_files_at("res://Scenes/Rooms/"):
		Rooms.append(load(("res://Scenes/Rooms/" + filePath)))
	
	while room != roomsToGenerate:
		var gene = Rooms.pick_random().instantiate()
		add_child(gene)
		if LastRoom:
			gene.get_node("room-template").get_node("Robot-0").queue_free()
			gene.global_position = LastRoom.get_node("room-template").get_node("End").global_position
		
		
		LastRoom = gene
		room += 1
		pass
