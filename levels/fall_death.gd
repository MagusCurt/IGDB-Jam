extends Area2D

@export var player: Node2D

func _process(_delta: float) -> void:
	global_position.x = player.global_position.x