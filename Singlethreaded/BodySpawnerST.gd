extends Node

var body_scene = preload("res://Singlethreaded/BodyST.tscn")
var rng = RandomNumberGenerator.new()


func _ready() -> void:
	rng.randomize()
	
	for i in 1000:
		var body = body_scene.instance()
		var screen_size = get_viewport().get_visible_rect().size
		var x = rng.randi_range(0, screen_size.x)
		var y = rng.randi_range(0, screen_size.y)
		body.position = Vector2(x, y)
		body.left = i % 2 == 0
		add_child(body)
