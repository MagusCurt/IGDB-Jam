extends CanvasLayer

@export var activation_time: float = 0.5
@export var tutorial_text: String = "HOLD SPACE"
@export var input_action: String = "space"
@export var is_tutorial: bool = false

func _ready() -> void:
	if UiSingleton.game_over:
		$GameOverUI.visible = true  # Hide game over UI initially
		#Hide all other children of GUI
		for child in get_children():
			if child.name != "GameOverUI":
				child.visible = false
	else:
		$GameOverUI.visible = false  # Hide game over UI initially

func _on_button_pressed() -> void:
	#restart scene
	print_debug("Restarting scene...")
	UiSingleton.game_over = false  # Reset game over state
	$GameOverUI.visible = false  # Hide game over UI
	get_tree().change_scene_to_file("res://levels/level_spawner.tscn")
