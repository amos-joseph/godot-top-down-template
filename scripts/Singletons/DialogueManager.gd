extends Node

@onready var text_box_scene = preload("res://text_box.tscn")

var dialogue_text: String = ""
var text_box
var text_box_position: Vector2
var is_dialoge_active = false

func start_dialogue(position: Vector2, dialogue: String):
	if is_dialoge_active:
		return
	
	dialogue_text = dialogue
	text_box_position = position
	_show_text_box()
	is_dialoge_active = true
	
func _show_text_box():
	text_box = text_box_scene.instantiate()
	get_tree().root.add_child(text_box)
	text_box.display_text(text_box_position, dialogue_text)

func _unhandled_input(event):
	if event.is_action_pressed("advance_dialogue") && is_dialoge_active:
		text_box.queue_free()
		is_dialoge_active = false
		return
	
func end_dialogue():
	if is_dialoge_active:
		text_box.queue_free()
		is_dialoge_active = false
		
