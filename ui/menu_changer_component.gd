class_name MenuChangerComponent
extends Node

@export var signal_name : String
@export var menu_manager : MenuManager
@export var move_to_menu : MenuContainer


func _ready() -> void:
	owner = get_parent()

	if signal_name:
		if owner.has_signal(signal_name):
			owner.connect(signal_name, on_signal)
		else:
			push_warning("%s doesn't have a %s signal" % [owner.name, '"' + signal_name + '"'])


func on_signal() -> void:
	menu_manager.current_menu = move_to_menu
