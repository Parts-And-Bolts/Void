extends CanvasLayer


@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible and not audio_stream_player.playing:
		audio_stream_player.play()
	if not visible and audio_stream_player.playing:
		audio_stream_player.stop()
