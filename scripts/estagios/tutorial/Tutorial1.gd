extends "res://scripts/estagios/RodarEstagio.gd"

var iniciou = false

func _process(delta):
	if not iniciou:
		if Input.is_action_just_pressed('start'):
			iniciou = true
			if not $Audio.playing:
				$Audio.play()
	elif iniciou:
		if not $Audio.playing:
			$Audio.play()
		if Input.is_action_just_pressed('start'):
			$Audio.stop()
			iniciou = false
