extends Label

func _process(_delta: float) -> void:
	text = "Battery Left: " + str(PlayerData.batteryLevel)
