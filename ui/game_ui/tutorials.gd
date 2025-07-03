extends Control

@export var activation_time = 0.25
var tutorial_text = 'HOLD SPACE'
var input_action = 'space'

var tutorial_active: bool = false

func _ready() -> void:
    # Connect the tutorial change signal to update the tutorial text and input action
    UiSingleton.connect("tutorial_change", _on_tutorial_change)

func _process(_delta: float) -> void:

    if TimeSingleton.ui_time >= activation_time and !tutorial_active:
        tutorial_active = true
        visible = true
        get_tree().paused = true
        %Label.text = tutorial_text
        $AnimationPlayer.play("notice")

    if tutorial_active and Input.is_action_just_pressed(input_action):
        # visible = false
        get_tree().paused = false
        $AnimationPlayer.stop()
        visible = false

func _on_tutorial_change() -> void:
    tutorial_text = "UP ARROW or W to JUMP"
    input_action = "up"  # Update the input action to match the jump action
    tutorial_active = false  # Reset the tutorial state