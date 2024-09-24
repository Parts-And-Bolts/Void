extends Label

func _process(delta: float) -> void:
	text = "Battery Left: " + str(PlayerData.batteryLevel)
