extends Node

var score = 0 setget set_score

onready var scoreLabel = $ScoreLabel

func set_score(value):
	score = value
	scoreLabel.text = "Score = " + str(score)
	update_save_data()
	
func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)

func _on_Ship_player_death():
	update_save_data()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://GameOverScene.tscn")
