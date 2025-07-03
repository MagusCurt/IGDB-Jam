extends Node

var global_time_scale: float = 1.0

signal reverse_time
signal continue_time

var ui_time : float = 0.0

var level_started: bool = false

func _ready() -> void:
    # Initialize the start time when the game starts
    connect("reverse_time", _on_reverse_time)
    connect("continue_time", _on_continue_time)


func _process(delta: float) -> void:
    if level_started:
        ui_time += delta * global_time_scale

func _on_reverse_time() -> void:
    if ui_time <= 0.0:
        ui_time = 0.0  # Clamp time to zero
        global_time_scale = 0  # Stop time at zero
    else:
        global_time_scale = -1.0  # Set the time scale to reverse

func _on_continue_time() -> void:
    # Ensure time doesn't go below zero when resuming
    if ui_time < 0.0:
        ui_time = 0.0
    global_time_scale = 1.0  # Set the time scale to normal