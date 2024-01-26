extends MarginContainer

@export var label: Label
@export var timer: Timer

var player: CharacterBody2D  
const MAX_WIDTH = 448

var text = ""
var letter_index = 0
var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

signal finished_displaying()

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	display_text("Here is some text to display!")

func display_text(text_to_display: String):
	text = text_to_display
	label.text = text_to_display
	await resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y = size.y
		
	global_position.x = player.position.x - size.x / 2
	global_position.y = player.position.y - size.y / 2 + 50
	#label.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
