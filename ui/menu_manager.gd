class_name MenuManager 
extends Node


@export var current_menu : MenuContainer :
	set(value):
		#Hide previous MenuContainer and show next
		if current_menu:
			current_menu.hide()
		value.show()

		current_menu = value


func _ready() -> void:
	for menu : MenuContainer in get_children():
		menu.hide()

	#Call set function
	current_menu = current_menu

	#Get the first MenuContainer if there's any
	if !current_menu:
		if get_children():
			if get_child(0) is MenuContainer:
				current_menu = get_child(0)
