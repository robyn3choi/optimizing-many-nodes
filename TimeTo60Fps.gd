extends Label

var has_printed = false


func _process(delta: float) -> void:
	if Engine.get_frames_per_second() >= 60 && !has_printed:
		text = String(OS.get_ticks_msec()) + "ms to reach 60 fps"
		has_printed = true
