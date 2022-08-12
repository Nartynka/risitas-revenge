extends Node

onready var highscoreLabel = $HighscoreLabel
onready var scoreLabel = $ScoreLabel

func _ready():
	var save_data = SaveAndLoad.load_data_from_file()
	highscoreLabel.text = "Highscore: " + str(save_data.highscore)
	scoreLabel.text = "Score: " + str(save_data.scores.back())

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		SceneChanger.change_scene("res://GUI/StartMenu/StartMenu.tscn")
	if Input.is_action_just_pressed("ui_accept"):
		SceneChanger.change_scene("res://World.tscn")
