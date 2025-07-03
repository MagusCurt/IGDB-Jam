extends Node2D

@export var level_length = 400

func _ready() -> void:
    if TimeSingleton.level_started:
        return  # If the level has already started, do not reset
    TimeSingleton.level_started = true  # Ensure TimeSingleton also knows the level has started
    TimeSingleton.ui_time = 0.0  # Reset UI time at the start of the level