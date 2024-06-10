extends Node2D

var total = 1
var last_checked_toll = 0
var last_checked_level = 0
var toll = 0
@onready var sword = get_node("/root/Game/Sword")

func _ready():
	sword = get_node("/root/Game/Sword")
	%GarlicToll.text = str(toll)
	%Level.text = "Level: " + str(total)

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%follow.progress_ratio = randf()
	new_mob.global_position = %follow.global_position
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob()


func _on_player_health_deplete():
	%GameOver.visible = true
	get_tree().paused = true
	
func toll_Increase():
	toll += 1

func check_toll_increase():
	%GarlicToll.text = str(toll)
	while last_checked_toll + 50 <= toll:  # Check if toll has increased by 50 or more
		total += 1
		%Timer.wait_time -= 0.05
		%Level.text = "Level: " + str(total)
		if last_checked_level + 5 <= total:
			sword.increase_timer()
			last_checked_level += 5
		last_checked_toll += 50  # Update last_checked_toll to reflect the new level


func _process(delta):
	check_toll_increase()
