extends Area2D
@export var SpawnChance = 5

func _ready():
	if randi_range(1,SpawnChance) != 1:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.get_node("Sounds/TimerCollect").play()
		PlayerData.timeLeft += 30
		Glitcheffect.get_node("EXplusion").set_shock()
		queue_free()
