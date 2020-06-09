extends Node2D

func _ready():
	if(global.chosen_texture == 1):
		$icon.set_texture(global.magenta_texture)
	else:
		$icon.set_texture(global.base_texture)
