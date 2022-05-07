extends "res://scripts/estagios/RodarEstagio.gd"

var indexMusica = 0
var indexBaixo = 0
var indexXilofone = 0
var indexFim = 56
var countdown = 19

var notasBaixo = ['C5', 'E5', 'A4', 'C5', 'F4', 'A4', 'G4', 'B4','C5', 'G4', 'C4']
var notasXilofone1 = ['C6', 'F5', 'E6', 'F6', 'G6', 'F6', 'C6', 'F5', 'C6'] 
var notasXilofone2 = ['A5', 'G5', 'C6', 'B5', 'E6', 'B5', 'A5', 'G5', 'C5']

var posMarcadorXilofone1 = [
	Vector2(-128, -38),
	Vector2(-65, 104),
	Vector2(-128, 170),
	Vector2(-62, 232),
	Vector2(-128, 298),
	Vector2(-63, 359),
	Vector2(-127, 425),
	Vector2(-258, 393),
	Vector2(-192, 327)
	]
var posMarcadorXilofone2 = [
	Vector2(128, -38),
	Vector2(65, 104),
	Vector2(128, 170),
	Vector2(62, 232),
	Vector2(128, 298),
	Vector2(63, 359),
	Vector2(127, 425),
	Vector2(258, 393),
	Vector2(192, 327)
	]

var indexMarcadorXilofone = 1

func respawnar(body):
	body.respawnar(Vector2(0,-36), 1)

func _on_AuxiliarAudio350BPM_finished():
	countdown()
	if indexMusica <= indexFim:
		$Audios/AuxiliarAudio350BPM.play()
		$GUI.moverMarcadoresAuxilio()
		indexMusica += 1
		if indexMusica >= 5:
			tocarInstrumentosAcompanhamento()
		if indexMusica >= 21:
			if indexXilofone <= 8:
				tocarInstrumentoJogadoresAusentes()

func tocarInstrumentosAcompanhamento():
	if indexBaixo < notasBaixo.size():
		if indexMusica <= indexFim - 10:
			indexBaixo = indexBaixo % 8
		$Audios/Baixo.tocarAudio('baixo', notasBaixo[indexBaixo])
		indexBaixo += 1
	
func tocarInstrumentoJogadoresAusentes():
	var numJogadores = $Jogadores.get_child_count()
	if indexBaixo%4 == 1:
		if numJogadores < 1:
			$Audios/Xilofone1.tocarAudio('xilofone2', notasXilofone1[indexXilofone])
		if indexMarcadorXilofone <= 8:
			moverMarcador('xilofone1')
		else:
			$Marcadores/Player1.queue_free()
	elif indexBaixo%4 == 2 and numJogadores < 3:
		$Audios/Pandeiro1.tocarAudio('pandeiro', '')
	elif indexBaixo%4 == 3:
		if numJogadores < 2:
			$Audios/Xilofone2.tocarAudio('xilofone2', notasXilofone2[indexXilofone])
		if indexMarcadorXilofone <= 8:
			moverMarcador('xilofone2')
		else:
			$Marcadores/Player2.queue_free()
		indexXilofone += 1
	elif indexBaixo%4 == 0 and numJogadores < 4:
		$Audios/Pandeiro2.tocarAudio('pandeiro', '')

func countdown():
	if countdown == 0:
		$GUI/Control/Info/SePrepare.text = ""
		$GUI/Control/Info/Count.text = "PULA!"
	elif countdown > 0:
		$GUI/Control/Info/Count.text = str(countdown)
	if countdown == -2:
		$GUI/Control/Info.queue_free()
	countdown -= 1

func moverMarcador(marcador):
	if marcador == 'xilofone1':
		$Marcadores/Player1.global_position = posMarcadorXilofone1[indexMarcadorXilofone]
	elif marcador == 'xilofone2':
		$Marcadores/Player2.global_position = posMarcadorXilofone2[indexMarcadorXilofone]
		indexMarcadorXilofone += 1
		
