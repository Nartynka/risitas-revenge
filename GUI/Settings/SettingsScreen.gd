extends Control

var settings = SaveAndLoad.load_data_from_file()

onready var fullscreenToggle = $VBoxContainer/FullscreenToggle
onready var muteToggle = $VBoxContainer/MuteToggle

func _ready():
	fullscreenToggle.pressed = settings.is_fullscreen
	muteToggle.pressed = settings.is_mute

func _on_Fullscreen_toggled(button_pressed):
	settings.is_fullscreen = button_pressed
	SaveAndLoad.save_data_to_file(settings)
	OS.set_window_fullscreen(settings.is_fullscreen)


func _on_Mute_toggled(button_pressed):
	settings.is_mute=button_pressed
	SaveAndLoad.save_data_to_file(settings)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), settings.is_mute)

func _on_BackButton_pressed():
	SceneChanger.change_scene("res://GUI/StartMenu/StartMenu.tscn")
