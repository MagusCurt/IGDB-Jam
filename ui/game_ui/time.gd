extends Control

func _process(_delta):
	#format the time to no decimal places

	#round the time to no decimal places
	%TimeLabel.text = str(int(TimeSingleton.ui_time)) + " seconds"
