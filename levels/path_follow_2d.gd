extends PathFollow2D

var direction: Vector2 = Vector2.RIGHT

var speed: float = 0.5
@export var min_speed: float = 2
@export var max_speed: float = 5

var rotation_direction: int = -1 # 0 for no rotation, 1 for clockwise, -1 for counter-clockwise
@export var rotation_max: float = 90

var activation_time: float = -1


var end_time = 0

@onready var child = get_children()[0]

func _process(delta: float) -> void:
	if TimeSingleton.ui_time > activation_time and activation_time != -1:
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


# func _on_area_2d_body_entered(body:Node2D) -> void:
# 	if body.name == "Player":
# 		print_debug("PathFollow2D activated")
# 		activation_time = TimeSingleton.ui_time

# 		#speed to random betwen min_speed and max_speed
# 		speed = randf_range(min_speed, max_speed)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print_debug("PathFollow2D activated")
		activation_time = TimeSingleton.ui_time

		#speed to random betwen min_speed and max_speed
		speed = randf_range(min_speed, max_speed)
