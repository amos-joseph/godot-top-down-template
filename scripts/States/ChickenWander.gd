extends State
class_name ChickenWander

@export var parent: CharacterBody2D
@export var sprite: AnimatedSprite2D
@export var collision: Collision
@export var move_speed := 20.0   

var player: CharacterBody2D  

var move_direction: Vector2
var wander_time: float
var collision_occured: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	collision.collision.connect(_on_collide)

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)  
	
func enter():
	player = get_tree().get_first_node_in_group("Player")
	sprite.play("walk")
	randomize_wander()

func update(delta: float):
	if collision_occured:
		# We do nothing because we already handled the collision
		collision_occured = false
	elif wander_time > 0:
		wander_time -= delta
	else:
		transitioned.emit(self, "ChickenIdle")

func update_physics(delta: float):
	if parent:
		parent.velocity = move_direction * move_speed	
		parent.move_and_slide() 
		
	var direction = player.global_position - parent.global_position	
		
	if direction.length() < 30:
		transitioned.emit(self, "ChickenFollow")
		
func _on_collide(rid:RID, normal:Vector2):
	collision_occured = true
	move_direction = normal
	

