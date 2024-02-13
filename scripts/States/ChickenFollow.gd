extends State
class_name ChickenFollow

@export var parent: CharacterBody2D
@export var sprite: AnimatedSprite2D
@export var collision: Collision
@export var move_speed := 30.0 

var player: CharacterBody2D  
var follow_distance
var direction
var collision_normal:Vector2 = Vector2(0,0)

func enter():
	player = get_tree().get_first_node_in_group("Player")
	follow_distance = 25
	collision.collision.connect(_on_collide)

func update_physics(delta: float):
	direction = player.global_position - parent.global_position
	
	if direction.length() > follow_distance:
		parent.velocity = (direction.normalized() + collision_normal) * move_speed
		sprite.play("walk")
		collision_normal = Vector2(0,0)
		
	if direction.length() > 100:
		transitioned.emit(self, "ChickenWander")
	
	parent.move_and_slide()
	
func _on_collide(rid:RID, normal:Vector2):
		collision_normal = normal
	
