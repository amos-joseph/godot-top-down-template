extends StaticBody2D

@export var player: CharacterBody2D
@export var sign_text: String

var open_dialogue = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Area2D.overlaps_body(player):
		open_dialogue = true
		DialogueManager.start_dialogue(Vector2(position.x, position.y), sign_text)
	elif $Area2D.overlaps_body(player) == false && open_dialogue:
		open_dialogue = false
		DialogueManager.end_dialogue()
	
