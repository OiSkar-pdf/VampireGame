extends CharacterBody2D

var health = 1

@onready var player = get_node("/root/Game/Player")

func _ready():
	player = get_node("/root/Game/Player")
	

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 250.0
	move_and_slide()
	

func take_damage():
	health -= 1
	if health == 0:
		queue_free()
