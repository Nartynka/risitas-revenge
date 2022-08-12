extends Area2D

export(int) var SPEED = 40
export(int) var ARMOR = 3

onready var animation = $AnimationPlayer

func _process(delta):
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body):
	if body.name != "Player":
		Effects.hit(self)
		body.queue_free()
		ARMOR-=1
		if ARMOR>0:
			animation.play(str(ARMOR)+"_hp")
		if ARMOR<=0:
			Effects.explosion(self)
			add_to_score()
			queue_free()

func player_hit():
	Effects.explosion(self)
	queue_free()

func add_to_score():
	var main = get_tree().current_scene
	if main.is_in_group("World"):
		main.score+= 10
