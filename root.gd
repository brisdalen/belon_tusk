extends Node2D

onready var hover = preload("res://Hover.tscn")
onready var box = preload("res://box.tscn")
onready var box_container = get_node("box_container")
onready var mouse_pos = get_node("mouse_pos")

var screensize
var viewport
var hover_sprite
var score = 0;
# if you can drop a new piece 
var can_drop
# The number of pieces before they start turning static
var static_limit = 5
var chosen_texture = 0

signal box_dropped

func _ready():
	viewport = get_viewport()
	hover_sprite = hover.instance()
	hover_sprite.position = Vector2(-50,-50)
	mouse_pos.add_child(hover_sprite)
	screensize = get_viewport_rect().size
	set_process(true)
	can_drop = true
	#spawn_boxes(10)

func spawn_boxes(num):
	for i in range(num):
		var b = box.instance()
		box_container.add_child(b)
		b.position = (Vector2(rand_range(0, screensize.x-40),
						  	  rand_range(0, screensize.y-100)))

func spawn_box(pos):
	var b = box.instance()
	box_container.add_child(b)
	b.position = pos
	var num_of_children = box_container.get_child_count()
	# Changes the 4th child to static mode. Change this to when the box lands within a certain threshold?
	if num_of_children > static_limit:
		box_container.get_child(num_of_children-(static_limit+1)).mode = 3
	global.blocks_placed = global.blocks_placed + 1
	emit_signal("box_dropped")
	print("blocks placed: ", global.blocks_placed)

func _process(delta):
	var mouse_pos = viewport.get_mouse_position()
	if((mouse_pos.x >= 0 && mouse_pos.x < viewport.size.x) && 
	   (mouse_pos.y >= 0 && mouse_pos.y < viewport.size.y)):
		#print("Inside game screen")
		hover_sprite.position = viewport.get_mouse_position()
		if Input.is_action_just_released("mouse_click_left") && can_drop:
			spawn_box(mouse_pos)