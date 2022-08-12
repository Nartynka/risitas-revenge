extends Node

const ExplosionEffect = preload("res://Effects/ExplosionEffect/ExplosionEffect.tscn")
const HitEffect = preload("res://Effects/HitEffect/HitEffect.tscn")

func explosion(caller):
	var main = get_tree().current_scene
	var explosionEffect = ExplosionEffect.instance()
	main.add_child(explosionEffect)
	explosionEffect.global_position = caller.global_position

func hit(caller):
	var main = get_tree().current_scene
	var hitEffect = HitEffect.instance()
	main.add_child(hitEffect)
	hitEffect.global_position = caller.global_position
