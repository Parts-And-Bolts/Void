extends Label

func _process(_delta: float) -> void:
	if PlayerData.gameStarted:
		text = "Battery Left: " + str(PlayerData.batteryLevel)
	else:
		text = "GETTING DATA"
