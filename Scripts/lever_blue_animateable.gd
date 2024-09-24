extends InteractableObject2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func execute():
	if isInside and not isPressed:
		var animateable: AnimationPlayer = get_node(objectPath)
		if animateable:
			isPressed = true
			animated_sprite_2d.play("default")
			animateable.play("default")
