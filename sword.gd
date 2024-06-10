extends Area2D

func _physics_process(delta):
	var enem_range = get_overlapping_bodies()
	if enem_range.size() > 0:
		var target = enem_range.front()
		look_at(target.global_position)

func shoot():
	const DAGGER = preload("res://dagger.tscn")
	var new_dag = DAGGER.instantiate()
	new_dag.global_rotation = %HitPoint.global_rotation - deg_to_rad(90)
	new_dag.global_position = %HitPoint.global_position
	%HitPoint.add_child(new_dag)

func increase_timer():
	%Timer.wait_time -= 0.01

func _on_timer_timeout():
	shoot()
