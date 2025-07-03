extends CanvasLayer

@export var activation_time: float = 0.5
@export var tutorial_text: String = "HOLD SPACE"
@export var input_action: String = "space"
@export var is_tutorial: bool = false

# func _ready() -> void:
#     UiSingleton.connect("tutorial_change", _on_tutorial_change)


# func _on_tutorial_change() -> void:
#     var tutorial_text = "UP ARROW or W to JUMP"
#     input_action