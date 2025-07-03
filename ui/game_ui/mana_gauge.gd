extends Control

var mana_display = 100

func _process(delta: float) -> void:
	if UiSingleton.player_mana != TYPE_NIL:
		mana_display = UiSingleton.player_mana
		%ManaGauge.value = mana_display
