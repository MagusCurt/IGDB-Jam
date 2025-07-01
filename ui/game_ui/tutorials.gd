extends Control

@export var activation_time: float = 0.0

var tutorial_active: bool = false

var tutorial_text: String = "HOLD SPACE"

func _process(_delta: float) -> void:
    if TimeSingleton.ui_time >= activation_time and !tutorial_active:
        tutorial_active = true
        visible = true
        get_tree().paused = true
        %Label.text = tutorial_text
        $AnimationPlayer.play("notice")

    if tutorial_active and Input.is_action_just_pressed("space"):
        # visible = false
        get_tree().paused = false
        %Label.text = "WASD or Arrow Keys to Move"
        $AnimationPlayer.stop()

