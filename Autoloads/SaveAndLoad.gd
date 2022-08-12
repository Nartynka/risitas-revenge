extends Node

const SAVE_DATA_PATH = "res://save_data"
const DEFAULT_SAVE_DATA = {
	highscore = 0,
	scores = [],
	is_fullscreen = true,
	is_mute = false,
}

func _ready():
	var settings = SaveAndLoad.load_data_from_file()
	OS.set_window_fullscreen(settings.is_fullscreen)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), settings.is_mute)


func save_data_to_file(to_save):
	var save_data = load_data_from_file()
	if to_save.has('score'):
		save_data.scores.push_back(to_save.score)
		if to_save.score > save_data.highscore:
			save_data.highscore = to_save.score
	if to_save.has('is_fullscreen'):
		save_data.is_fullscreen = to_save.is_fullscreen
	if to_save.has('is_mute'):
		save_data.is_mute = to_save.is_mute
	var json_data = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_data)
	save_file.close()
	
func load_data_from_file():
	var save_file = File.new()
	if !save_file.file_exists(SAVE_DATA_PATH):
		return DEFAULT_SAVE_DATA
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	return save_data
