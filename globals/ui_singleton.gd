extends Node

var game_state: String = "unpaused" # Possible values: "unpaused", "paused", "game_over"


signal toggle_pause

func pause_game() -> void:
    game_state = "paused"
    get_tree().paused = true

func unpause_game() -> void:
    game_state = "unpaused"
    get_tree().paused = false