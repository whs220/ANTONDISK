extends Node

var enabled = false # DONT FORGET!!

var num = 0

func _unhandled_input(event):
	if enabled:
		if event.is_action_pressed("take_screenshot"):
			var image = get_viewport().get_texture().get_data()
			image.flip_y()
			
			var dir = Directory.new()
			while true:
				var file = "C:/Users/12162/OneDrive/Desktop/BleedShots/screenshot_" + str(num) + ".png"
				if dir.file_exists(file):
					num += 1
				else:
					image.save_png(file)
					break
