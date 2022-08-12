extends Node

var score = 0 setget set_score

onready var scoreLabel = $GUI/ScoreLabel

func set_score(value):
	score = value
	scoreLabel.text = "Score = " + str(score)
	
func update_save_data():
	var save_data = {}
	save_data.score = score
	SaveAndLoad.save_data_to_file(save_data)

func game_over():
	get_tree().paused = true
	Effects.explosion($Player)
	$Player.queue_free()
	update_save_data()
	yield(get_tree().create_timer(0.7), "timeout")
	get_tree().change_scene("res://GameOver/GameOverScene.tscn")
	get_tree().paused = false

func _on_Player_death():
	game_over()

func _on_EnemyDetect_area_entered(area):
	game_over()
