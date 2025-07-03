class_name MenuContainer
extends Control


func select() -> void:
	var menu_manager : MenuManager = get_parent()

	menu_manager.current_menu = self
