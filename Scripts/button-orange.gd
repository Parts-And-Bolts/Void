extends InteractableDestroyObject2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func execute():
	if isInside and not isPressed:
		var object = get_node(objectPath)
		isPressed = true
		animated_sprite_2d.play("default")
		await animated_sprite_2d.animation_finished
		object.queue_free()
