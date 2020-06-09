extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	if(global.chosen_texture == 1):
		set_texture(global.magenta_texture)
	else:
		set_texture(global.base_texture)