extends Control

var mana_display = 100

func _process(_delta: float) -> void:
	print_debug(UiSingleton.player_mana)
	if UiSingleton.player_mana != TYPE_NIL:
		mana_display = UiSingleton.player_mana
		%ManaGauge.value = mana_display
