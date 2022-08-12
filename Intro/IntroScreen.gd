extends Control

func _ready():
	SceneChanger.fade_in()
	yield(get_tree().create_timer(1.7), "timeout")
	SceneChanger.change_scene("res://GUI/StartMenu/StartMenu.tscn", 0.5)
