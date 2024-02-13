extends CharacterBody2D

@onready var sprite: = get_node("Sprite")

func _ready():
	sprite.play("walk")

func _process(delta):
	if velocity.x > 0:
		$Sprite.flip_h = false
	else: 
		$Sprite.flip_h = true
