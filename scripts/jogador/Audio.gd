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
	elif instrumento == 'xilofone2':
		if nota == 'C6':
			stream = preload('res://audio/xilofone2/C6.ogg')
		elif nota == 'A5':
			stream = preload('res://audio/xilofone2/A5.ogg')
		elif nota == 'F5':
			stream = preload('res://audio/xilofone2/F5.ogg')
		elif nota == 'G5':
			stream = preload('res://audio/xilofone2/G5.ogg')
		elif nota == 'E6':
			stream = preload('res://audio/xilofone2/E6.ogg')
		elif nota == 'F6':
			stream = preload('res://audio/xilofone2/F6.ogg')
		elif nota == 'B5':
			stream = preload('res://audio/xilofone2/B5.ogg')
		elif nota == 'G6':
			stream = preload('res://audio/xilofone2/G6.ogg')
		elif nota == 'C5':
			stream = preload('res://audio/xilofone2/C5.ogg')
		elif nota == 'GSH5':
			stream = preload('res://audio/xilofone2/GSH5.ogg')
	elif instrumento == 'pandeiro':
		stream = preload('res://audio/pandeiro/som.ogg')
	elif instrumento == 'bumbo':
		stream = preload("res://audio/bumbo/kick.ogg")
	elif instrumento == 'baixo':
		if nota == 'C5':
			stream = preload("res://audio/baixo/C5.ogg")
		elif nota == 'E5':
			stream = preload("res://audio/baixo/E5.ogg")
		elif nota == 'A4':
			stream = preload("res://audio/baixo/A4.ogg")
		elif nota == 'F4':
			stream = preload("res://audio/baixo/F4.ogg")
		elif nota == 'G4':
			stream = preload("res://audio/baixo/G4.ogg")
		elif nota == 'B4':
			stream = preload("res://audio/baixo/B4.ogg")
		elif nota == 'C4':
			stream = preload("res://audio/baixo/C4.ogg")
	elif instrumento == 'grand piano':
		if nota == 'A3':
			stream = preload("res://audio/grand_piano/A3.ogg")
		elif nota == 'C4':
			stream = preload("res://audio/grand_piano/C4.ogg")
		elif nota == 'D4':
			stream = preload("res://audio/grand_piano/D4.ogg")
		elif nota == 'E4':
			stream = preload("res://audio/grand_piano/E4.ogg")
		elif nota == 'F3':
			stream = preload("res://audio/grand_piano/F3.ogg")
		elif nota == 'G3':
			stream = preload("res://audio/grand_piano/G3.ogg")
		elif nota == 'G4':
			stream = preload("res://audio/grand_piano/G4.ogg")
		elif nota == 'F4':
			stream = preload("res://audio/grand_piano/F4.ogg")
		elif nota == 'E3':
			stream = preload("res://audio/grand_piano/E3.ogg")
		elif nota == 'GSH3':
			stream = preload("res://audio/grand_piano/GSH3.ogg")
	play()
