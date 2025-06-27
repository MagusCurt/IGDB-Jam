extends PathFollow2D

var direction: Vector2 = Vector2.RIGHT

@export var speed: float = 0.5

func _process(delta: float) -> void:
    progress_ratio += delta * 0.5 * TimeSingleton.global_time_scale
