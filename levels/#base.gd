extends Node2D

func _ready() -> void:
    TimeSingleton.level_started = true  # Ensure TimeSingleton also knows the level has started
    TimeSingleton.ui_time = 0.0  # Reset UI time at the start of the level