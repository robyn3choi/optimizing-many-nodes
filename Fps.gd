extends Label

func _process(delta: float) -> void:
	text = String(Engine.get_frames_per_second()) + " fps"
