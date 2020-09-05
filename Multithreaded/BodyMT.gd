extends Area2D

var left = false
var speed = 50


func move(delta: float) -> void:
	var velocity = Vector2(5, 0) * speed * delta
	
	if left:
		rotation_degrees -= 4 * speed * delta
	else:
		rotation_degrees += 4 * speed * delta
		
	position += (velocity.rotated(deg2rad(rotation_degrees)))
