extends Label

func _ready():
	text = String(global.blocks_placed)

func _process(delta):
	update_value()

func update_value():
	# print("blocks: ", global.blocks_placed)
	text = String(global.blocks_placed)