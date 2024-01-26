extends State
class_name ChickenIdle

@export var parent: CharacterBody2D
@export var sprite: AnimatedSprite2D

var timer = 0.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	sprite.play("idle")
	timer = randf_range(.2, 5.0)
	
func exit():
	pass
	
func update(delta : float):
	if timer > 0:
		timer -= delta
	else:
		transitioned.emit(self, "ChickenWander")

