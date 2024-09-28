class_name Battery
extends Area2D

##The Chance For Said Battery To Spawn
@export var SpawnChance = 7
##How Much To Recharge Player's Battery
@export var BatteryRecharge = 50

func _ready() -> void:
	if randi_range(1,SpawnChance) != 1:
		queue_free()

func Collect():
	PlayerData.batteryLevel += BatteryRecharge
	
	PlayerData.batteryLevel = clamp(PlayerData.batteryLevel,0,100)
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.get_node("Sounds/BatteryCollect").play()
		Collect()
