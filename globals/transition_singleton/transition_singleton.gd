extends CanvasLayer

@onready var ani_player : AnimationPlayer = %AnimationPlayer


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


func start() -> void:
	ani_player.play("start")


func end() -> void:
	ani_player.play("end")


func change_scene_file(path : String) -> void:
	start()
	await ani_player.animation_finished

	get_tree().change_scene_to_file(path)

	end()


func change_scene_packed(scene : PackedScene) -> void:
	start()
	await ani_player.animation_finished

	get_tree().change_scene_to_packed(scene)

	end()
