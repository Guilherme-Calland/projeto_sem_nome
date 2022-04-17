extends AudioStreamPlayer

func tocarAudio(instrumento, nota):
	if instrumento == 'piano':
		if nota == 'A4':
			stream = preload("res://audio/piano/A4.ogg")
		elif nota == 'B4':
			stream = preload("res://audio/piano/B4.ogg")
		elif nota == 'E4':
			stream = preload("res://audio/piano/E4.ogg")
		elif nota == 'C5':
			stream = preload("res://audio/piano/C5.ogg")
		elif nota == 'A5':
			stream = preload("res://audio/piano/A5.ogg")
		elif nota == 'B5':
			stream = preload("res://audio/piano/B5.ogg")
		elif nota == 'E5':
			stream = preload("res://audio/piano/E5.ogg")
		elif nota == 'C6':
			stream = preload("res://audio/piano/C6.ogg")
		elif nota == 'D6':
			stream = preload("res://audio/piano/D6.ogg")
		elif nota == 'DSH6':
			stream = preload("res://audio/piano/DSH6.ogg")
		elif nota == 'E6':
			stream = preload("res://audio/piano/E6.ogg")
	elif instrumento == 'xilofone':
		if nota == 'C6':
			stream = preload('res://audio/xilofone/C6.ogg')
		elif nota == 'A5':
			stream = preload('res://audio/xilofone/A5.ogg')
		elif nota == 'F5':
			stream = preload('res://audio/xilofone/F5.ogg')
		elif nota == 'G5':
			stream = preload('res://audio/xilofone/G5.ogg')
		elif nota == 'E6':
			stream = preload('res://audio/xilofone/E6.ogg')
		elif nota == 'F6':
			stream = preload('res://audio/xilofone/F6.ogg')
		elif nota == 'B5':
			stream = preload('res://audio/xilofone/B5.ogg')
		elif nota == 'G6':
			stream = preload('res://audio/xilofone/G6.ogg')
	play()
