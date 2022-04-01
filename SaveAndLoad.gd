extends Node

const SAVE_DATA_PATH = "res://save_data"
const DEFAULT_SAVE_DATA = {
	highscore = 0
}

func save_data_to_file(save_data):
	var json_data = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_data)
	save_file.close()
	
func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return DEFAULT_SAVE_DATA
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	return save_data
