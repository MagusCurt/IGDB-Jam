extends CharacterBody2D

@export var speed: float = 200.0

var mana = 100.0

@export var gui : CanvasLayer
	
var mana_loss_rate: float = 80 # Rate at which mana is lost when using time control

@export var mana_recovery_rate: float = 40 # Rate at which mana is recovered over time

@export var jump_height: float = 400.0 # Height of the jump

var ko: bool = false # Knockout state

func _ready() -> void:
	print_debug(velocity)

func _process(delta: float) -> void:

	if ko:
		# If the player is knocked out, stop all movement
		velocity = Vector2.ZERO
		return

	velocity.x = speed

	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = -jump_height  # Jump height
	elif not is_on_floor():
		velocity.y += 1000.0 * delta  # Gravity effect

	if Input.is_action_pressed("space"):
		if mana > 0:
			mana -= mana_loss_rate * delta  # Decrease mana when using time control
			UiSingleton.player_mana = mana  # Update the UI with current mana
			TimeSingleton.emit_signal("reverse_time")
		else:
			# Optionally, you can handle the case where mana is depleted
			print("Not enough mana to reverse time.")
			TimeSingleton.emit_signal("continue_time")  # Stop time control if mana is depleted

	elif Input.is_action_just_released("space"):
		TimeSingleton.emit_signal("continue_time")
	else:
		# Recover mana over time when not using time control
		if mana < 100:
			mana += mana_recovery_rate * delta  # Increase mana when not using time control
			UiSingleton.player_mana = mana  # Update the UI with current mana

	move_and_slide()

func _on_jump_tutorial_trigger_body_entered(body:Node2D) -> void:
	if body.name == "Player":
		# Emit the tutorial change signal to update the tutorial text and input action
		UiSingleton.tutorial_change.emit()

func _on_hurt_box_area_entered(area:Area2D) -> void:
	# change to scene
	UiSingleton.game_over = true
	get_tree().change_scene_to_file("res://ui/game_ui/gui.tscn")
