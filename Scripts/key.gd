extends Label
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"

func _input(event: InputEvent) -> void:
	if event.is_action("jump") and not PlayerData.gameStarted:
		PlayerData.gameStarted = true
		audio_stream_player.play()
		visible = false
