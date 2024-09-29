extends InteractableDestroyObject2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D




func execute():
	if isInside and not isPressed:
		var object = get_node(objectPath)
		isPressed = true
		animated_sprite_2d.play("default")
		audio_stream_player_2d.play()
		await animated_sprite_2d.frame_changed
		object.queue_free()
