extends Node

var body_scene = preload("res://Multithreaded/BodyMT.tscn")
var rng = RandomNumberGenerator.new()
var bodies = []
var threads = []
var num_threads = 12


func _ready() -> void:
	rng.randomize()
	
	for i in num_threads:
		var thread = Thread.new()
		threads.push_back(thread)
	
	for i in 1000:
		var body = body_scene.instance()
		var screen_size = get_viewport().get_visible_rect().size
		var x = rng.randi_range(0, screen_size.x)
		var y = rng.randi_range(0, screen_size.y)
		body.position = Vector2(x, y)
		body.left = i % 2 == 0
		add_child(body)
		bodies.push_back(body)


func _process(delta):
	for i in num_threads:
		threads[i].start(self, "move_bodies", {"delta": delta, "index": i})
	
	for i in num_threads:
		threads[i].wait_to_finish()


func move_bodies(args):
	# find start and end index in bodies that this thread will operate on
	var start = bodies.size() / num_threads * args.index
	var end = start + bodies.size() / num_threads
	if args.index == threads.size() - 1:
		end += bodies.size() % num_threads
	for i in range(start, end):
		bodies[i].move(args.delta)


#func _process(delta: float) -> void:
#	for b in bodies:
#		b.move(delta)
