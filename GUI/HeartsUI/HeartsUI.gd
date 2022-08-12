extends Control

onready var Player = get_tree().current_scene.get_node("Player")
onready var empty_heart = preload("./heart_empty.png")
func _on_Player_player_dmg():
	get_children()[Player.HEALTH].texture = empty_heart
