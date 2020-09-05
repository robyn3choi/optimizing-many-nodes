extends Area2D

var left = false
var speed = 50

func _physics_process(delta: float) -> void:
	move(delta)
	
	
func move(delta):
	var velocity = Vector2(5, 0) * speed * delta

	if left:
		rotation_degrees -= 4 * speed * delta
	else:
		rotation_degrees += 4 * speed * delta
		
	position += (velocity.rotated(deg2rad(rotation_degrees)))
