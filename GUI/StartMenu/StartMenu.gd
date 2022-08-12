extends Node

func _ready():
#	$AnimationPlayer.play("fadeIn")
#	yield($AnimationPlayer, "animation_finished")
	$VBoxContainer/StartButton.shortcut_in_tooltip = false
	$VBoxContainer/QuitButton.shortcut_in_tooltip = false

func _on_StartButton_pressed():
	SceneChanger.change_scene("res://World.tscn")

func _on_QuitButton_pressed():
	 get_tree().quit()

func _on_SettingsButton_pressed():
	SceneChanger.change_scene("res://GUI/Settings/SettingsScreen.tscn")


func _on_HistoryButton_pressed():
	SceneChanger.change_scene("res://GUI/History/HistoryScreen.tscn")
