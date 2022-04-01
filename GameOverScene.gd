extends Node

onready var highscoreLabel = $HighscoreLabel

func _ready():
	var save_data = SaveAndLoad.load_data_from_file()
	highscoreLabel.text = "Highscore: " + str(save_data.highscore)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://StartMenu.tscn")
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://World.tscn")
