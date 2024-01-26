extends State
class_name ChickenFollow

@export var parent: CharacterBody2D
@export var sprite: AnimatedSprite2D
@export var collision: Collision
@export var move_speed := 30.0 

var player: CharacterBody2D  
var follow_distance
var direction
var collision_timer = 0.0
var collision_dir: Vector2

func enter():
	player = get_tree().get_first_node_in_group("Player")
	follow_distance = 25
	collision.collision.connect(_on_collide)

func update_physics(delta: float):
	var direction = player.global_position - parent.global_position
	
	if collision_timer > 0:
		parent.velocity = collision_dir * move_speed
		collision_timer -= delta
		sprite.play("walk")
	elif direction.length() > follow_distance:
		parent.velocity = direction.normalized() * move_speed
		sprite.play("walk")
	else:
		sprite.play("idle")
		parent.velocity = Vector2()
		
	if direction.length() > 100:
		transitioned.emit(self, "ChickenWander")
	
	parent.move_and_slide()
	
func _on_collide(rid:RID, normal:Vector2):
	if rid == player.get_rid():
		collision_dir = normal
		collision_timer = 1
	
