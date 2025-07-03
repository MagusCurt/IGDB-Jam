extends Node2D

@export var player : CharacterBody2D

var level_array: Array = []

var pitfall_scene: PackedScene
var pillar_scene: PackedScene
var basic_scene: PackedScene
var crushing_scene: PackedScene

var generated_length: float = 3200

var generating: bool = false

func _ready() -> void:
	pitfall_scene = load("res://levels/variants/pitfall.tscn")
	pillar_scene = load("res://levels/variants/falling_pillar.tscn")
	basic_scene = load("res://levels/#base.tscn")
	crushing_scene = load("res://levels/variants/crushing_pillar.tscn")


func _process(delta):
	if player.global_position.x > generated_length - 1500 and not generating:
		generating = true
		generate()  # Generate new levels when the player is close to the end of the current level

func generate() -> void:
	#Add ten levels to the array
	#Each level is a random scene between pitfall, pillar, and basic
	var random_scene: PackedScene = null
	var random_number: int = randi() % 4

	if random_number == 0:
		random_scene = pitfall_scene
	elif random_number == 1:
		random_scene = pillar_scene
	elif random_number == 2:
		random_scene = basic_scene
	else:
		random_scene = crushing_scene

	var instance: Node2D = random_scene.instantiate()
	instance.position = Vector2(generated_length, 0)
	add_child(instance)
	level_array.append(instance)

	generated_length += instance.level_length  # Increment the length for the next level

	generating = false
