extends Node
class_name Collision

@export var parent: CharacterBody2D

signal collision(collision_rid:RID, collision_normal:Vector2)

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is RayCast2D:
			child.collide_with_areas = true
			child.collide_with_bodies = true
			child.add_exception(parent)
	 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for child in get_children():
		if child is RayCast2D:
			if child.is_colliding():
				collision.emit(child.get_collider_rid(), child.get_collision_normal())
