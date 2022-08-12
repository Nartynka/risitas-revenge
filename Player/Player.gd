extends KinematicBody2D

const Bullet = preload("res://Bullet//Bullet.tscn")
export(int) var SPEED = 100
export(int) var HEALTH = 3
onready var animation = $AnimatedSprite
signal player_death
signal player_dmg

var velocity = Vector2(0,0)

func get_input():
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("ui_up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y += SPEED
		
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	velocity=Vector2.ZERO
	if Input.is_action_just_pressed("ui_select"):
		fire_bullet()

func fire_bullet():
	animation.play("openMouth")
	animation.set_frame(0)
	var bullet = Bullet.instance()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = global_position
	bullet.position.y += 10
	bullet.position.x += 10

func _on_Hurtbox_area_entered(area):
	Effects.hit(self)
	print(area)
	area.player_hit()
	HEALTH-=1
	emit_signal("player_dmg")
	if HEALTH<=0:
		emit_signal("player_death")
