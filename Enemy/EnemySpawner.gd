extends Node2D

const Enemy = preload("res://Enemy/Enemy.tscn")

onready var spawnPoints = $SpawnPoints

func get_spawn_position():
	var points = spawnPoints.get_children()
	points.shuffle()
	return points[0].global_position
	
func spawn_enemy():
	var main = get_tree().current_scene
	var enemy = Enemy.instance()
	enemy.global_position = get_spawn_position()
	main.add_child(enemy)

func _on_Timer_timeout():
	spawn_enemy()
