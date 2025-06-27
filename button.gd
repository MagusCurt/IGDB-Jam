extends Button

func _ready() -> void:
    # Connect the button's pressed signal to a method
    self.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:

    get_tree().reload_current_scene()