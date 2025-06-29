extends Control

func _ready() -> void:
	UiSingleton.connect('toggle_pause', _on_toggle_pause)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed('P'):
		if UiSingleton.game_state == "unpaused":
			UiSingleton.pause_game()

		elif UiSingleton.game_state == "paused":
			UiSingleton.unpause_game()

		UiSingleton.emit_signal("toggle_pause")


func _on_toggle_pause() -> void:
	print_debug("Pause menu visibility toggled")
	if UiSingleton.game_state == "paused":
		visible = true
	else:
		visible = false


func _on_resume_pressed() -> void:
	UiSingleton.unpause_game()
	visible = false

func _on_restart_pressed() -> void:
	UiSingleton.unpause_game()
	get_tree().reload_current_scene()