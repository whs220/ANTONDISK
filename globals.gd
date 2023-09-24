extends Node

var checkpoint = false
var secret = false

var total_bricks_broken = 0

## PROGRESS:
## 0 - New Game
## 1 - After beating the Tutorial, Unlocks Boiler City
## 2 - Boiler City is Unlocked, although not beaten
## 3 - Unlocks Fudge Mountain, although not beaten
## 4 - Fudge Mountain is Unlocked, although not beaten
## 5 - Unlocks clock
## 6 - Clock is unlocked, not beaten
## 7 - Satan unlock
## 8 - Satan not beaten / End of game

var progress = 0

var beat_game = false

## Treasures

var treasure_0 = false
var treasure_1 = false
var treasure_2 = false
var treasure_3 = false

## Top Scores

var brulo_ts = 0
var boiler_ts = 0
var fudge_ts = 0
var clock_ts = 0

## Settings

var screen_shake = true
var vsync = true
var fullscreen = false

## Temp
var temp_treasures = -1

var infinite_hp = false

func add_score(s):
	var ui = get_tree().get_nodes_in_group("UI")[0]
	ui.add_score(s)

func load_game():
	var config = ConfigFile.new()
	# Load data from a file.
	var err = config.load("user://antondisk_data.cfg")
	# If the file didn't load, ignore it.
	if err != OK:
		return
	
	progress = config.get_value("GameData", "progress")
	treasure_0 = config.get_value("GameData", "treasure0")
	treasure_1 = config.get_value("GameData", "treasure1")
	treasure_2 = config.get_value("GameData", "treasure2")
	treasure_3 = config.get_value("GameData", "treasure3")
	total_bricks_broken = config.get_value("GameData", "tbb")
	
	brulo_ts = config.get_value("GameData", "brulo_top_score")
	boiler_ts = config.get_value("GameData", "boiler_top_score")
	fudge_ts = config.get_value("GameData", "fudge_top_score")
	clock_ts = config.get_value("GameData", "clock_top_score")
	
	beat_game = config.get_value("GameData", "beat_game")
	
	screen_shake = config.get_value("Settings", "screen_shake")
	vsync = config.get_value("Settings", "vsync")
	fullscreen = config.get_value("Settings", "fullscreen")
	
	OS.vsync_enabled = vsync
	OS.window_fullscreen = fullscreen

func save_game():
	# Create new ConfigFile object.
	var config = ConfigFile.new()

	# Store some values.
	config.set_value("GameData", "progress", progress)
	
	config.set_value("GameData", "treasure0", treasure_0)
	config.set_value("GameData", "treasure1", treasure_1)
	config.set_value("GameData", "treasure2", treasure_2)
	config.set_value("GameData", "treasure3", treasure_3)
	
	config.set_value("GameData", "brulo_top_score", brulo_ts)
	config.set_value("GameData", "boiler_top_score", boiler_ts)
	config.set_value("GameData", "fudge_top_score", fudge_ts)
	config.set_value("GameData", "clock_top_score", clock_ts)
	config.set_value("GameData", "beat_game", beat_game)
	config.set_value("GameData", "tbb", total_bricks_broken)
	
	config.set_value("Settings", "screen_shake", screen_shake)
	config.set_value("Settings", "vsync", vsync)
	config.set_value("Settings", "fullscreen", fullscreen)

	# Save it to a file (overwrite if already exists).
	config.save("user://antondisk_data.cfg")
