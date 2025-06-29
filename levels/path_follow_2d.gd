extends PathFollow2D

var direction: Vector2 = Vector2.RIGHT

@export var speed: float = 0.5

@export var activation_time: float = 0.0

var end_time = 0

func _process(delta: float) -> void:
	if TimeSingleton.ui_time >= activation_time:
		active(delta)

func active(delta: float) -> void:
	progress_ratio += delta * speed

	if progress_ratio >= 1.0 and end_time == 0:
		print_debug("end time set")
		end_time = TimeSingleton.ui_time


	if TimeSingleton.global_time_scale == -1:
		if end_time == 0 or TimeSingleton.ui_time <= end_time:
			speed = -abs(speed)
		else:
			speed = abs(speed)
	else:
		speed = abs(speed)
