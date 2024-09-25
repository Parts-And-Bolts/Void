extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if PlayerData.gameStarted:
		var time_elapsed = PlayerData.timeLeft
		@warning_ignore("integer_division")
		var minutes = time_elapsed / 60
		var seconds = fmod(time_elapsed, 60)
		var time_string = "%02d:%02d" % [minutes, seconds]
		text = time_string
	else:
		text = "99:99"
