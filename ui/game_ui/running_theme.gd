extends AudioStreamPlayer2D


@export var loop_end: float = 0.0

func _process(delta: float) -> void:

    if playing and get_playback_position() >= loop_end:
        play(0.0)