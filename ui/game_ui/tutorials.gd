extends Control

var activation_time = 0.25
var tutorial_text = 'HOLD SPACE'
var input_action = 'space'

var tutorial_active: bool = false

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

