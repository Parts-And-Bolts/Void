extends InteractableObject2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func execute():
	if isInside and not isPressed:
		var animateable: AnimationPlayer = get_node(objectPath)
		if animateable:
			isPressed = true
			audio_stream_player_2d.play()
			animated_sprite_2d.play("default")
			animateable.play("default")
