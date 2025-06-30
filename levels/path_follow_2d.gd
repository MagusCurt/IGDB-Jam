extends PathFollow2D

var direction: Vector2 = Vector2.RIGHT

@export var speed: float = 0.5

@export var activation_time: float = 0.0

@export var rotation_direction: int = 0 # 0 for no rotation, 1 for clockwise, -1 for counter-clockwise
@export var rotation_max: float = 360

var end_time = 0

@onready var child = get_children()[0]

func _process(delta: float) -> void:
	if TimeSingleton.ui_time >= activation_time:
		active(delta)

func active(delta: float) -> void:
	progress_ratio += delta * speed

	if progress_ratio >= 1.0 and end_time == 0:
		end_time = TimeSingleton.ui_time

	if child:
		child.rotation_degrees = rotation_direction * progress_ratio * rotation_max


	if TimeSingleton.global_time_scale == -1:
		if end_time == 0 or TimeSingleton.ui_time <= end_time:
			speed = -abs(speed)
		else:
			speed = abs(speed)
	else:
		speed = abs(speed)
