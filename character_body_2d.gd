extends CharacterBody2D

@export var speed: float = 200.0

func _process(delta: float) -> void:
    # gravity = 1000.0

    if Input.is_action_pressed("right"):
        velocity.x = speed
    elif Input.is_action_pressed("left"):
        velocity.x = -speed
    else:
        velocity.x = 0.0

    if Input.is_action_pressed("up") and is_on_floor():
        velocity.y = -400.0  # Jump height
    elif not is_on_floor():
        velocity.y += 1000.0 * delta  # Gravity effect

    if Input.is_action_pressed("space"):
        TimeSingleton.global_time_scale = -1
    else:
        TimeSingleton.global_time_scale = 1

    move_and_slide()