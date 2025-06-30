extends CanvasLayer



func _on_start_pressed() -> void:
	#change scene to the main game
	get_tree().change_scene_to_file("res://levels/#base.tscn")
