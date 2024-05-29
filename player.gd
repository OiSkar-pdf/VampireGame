extends CharacterBody2D

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	

func _process(delta):
	var sprite_pos = position

	# Ensure the sprite stays within the screen boundaries
	if sprite_pos.x < 0:
		sprite_pos.x = 0
	elif sprite_pos.x > 1200:
		sprite_pos.x = 1200

	if sprite_pos.y < 0:
		sprite_pos.y = 0
	elif sprite_pos.y > 650:
		sprite_pos.y = 650
		

	position = sprite_pos
