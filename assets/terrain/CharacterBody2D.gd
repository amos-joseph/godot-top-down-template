extends CharacterBody2D

var speed = 50  # speed in pixels/sec

@onready var sprite: = get_node("Sprite")

func _ready():
	sprite.play("idle")

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	move_and_slide()
	# position = Vector2(snapped(position.x, 1), snapped(position.y, 1))
