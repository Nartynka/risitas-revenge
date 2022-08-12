extends Control

onready var scoresLabel = $ScrollContainer/ScoresLabel

func _ready():
	var scores = SaveAndLoad.load_data_from_file().scores
	var i = scores.size()
	while i>0:
		scoresLabel.text += "Game "+str(i)+": "+str(scores[i-1])+"\n"
		i=i-1

func _on_BackButton_pressed():
	SceneChanger.change_scene("res://GUI/StartMenu/StartMenu.tscn")
