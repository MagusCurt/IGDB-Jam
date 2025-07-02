extends CanvasLayer


func _on_start_pressed() -> void:
	TransitionSingleton.change_scene_file("res://levels/variants/tutorial.tscn")
