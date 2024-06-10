extends Area2D

var travelled_dist = 0
@onready var scene = get_node("/root/Game")

func _ready():
	scene = get_node("/root/Game")

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_dist += SPEED * delta
	if travelled_dist > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	scene.toll_Increase()
	if body.has_method("take_damage"):
		body.take_damage()
