extends Node

var global_time_scale: float = 1.0

signal reverse_time
signal continue_time

var ui_time : float = 0.0


func _ready() -> void:
    # Initialize the start time when the game starts
    connect("reverse_time", _on_reverse_time)
    connect("continue_time", _on_continue_time)


func _process(delta: float) -> void:
    ui_time += delta * global_time_scale

func _on_reverse_time() -> void:
    global_time_scale = -1.0  # Set the time scale to reverse

func _on_continue_time() -> void:
    global_time_scale = 1.0  # Set the time scale to normal