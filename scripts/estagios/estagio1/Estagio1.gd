extends "res://scripts/estagios/RodarEstagio.gd"

var indexMusica = 0
var indexBaixo = 0
var indexXilofone = 0
var indexFim = 56
var countdown = 19

var notasBaixo = ['C5', 'E5', 'A4', 'C5', 'F4', 'A4', 'G4', 'B4','C5', 'G4', 'C4']
var notasXilofone1 = ['C6', 'F5', 'E6', 'F6', 'G6', 'F6', 'C6', 'F5', 'C6'] 
var notasXilofone2 = ['A5', 'G5', 'C6', 'B5', 'E6', 'B5', 'A5', 'G5', 'C5']

var audio0Lock = false
var audio1Lock = false
var audio2Lock = false
var audio3Lock = false
var audio4Lock = false

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
var posMarcadorPandeiro1 = [
	Vector2(32,55),
	Vector2(160,120),
	Vector2(33,182),
	Vector2(159,245),
	Vector2(34,311),
	Vector2(161,375),
	Vector2(288,438),
	Vector2(161,375),
	Vector2(288,438)
]

var posMarcadorPandeiro2 = [
	Vector2(-32,55),
	Vector2(-160,120),
	Vector2(-33,182),
	Vector2(-159,245),
	Vector2(-34,311),
	Vector2(-161,375),
	Vector2(-288,438),
	Vector2(-161,375),
	Vector2(-288,438)
]

var indexMarcadorXilofone = 1

func _ready():
	var numJogadores = $Jogadores.get_child_count()
	audio1Lock = true
	$GUI.alternarIconeAudio('1', audio1Lock)
	if numJogadores >= 2:
		audio2Lock = true
		$GUI.alternarIconeAudio('2', audio2Lock)
		if numJogadores >= 3:
			audio3Lock = true
			$GUI.alternarIconeAudio('3', audio3Lock)
			if numJogadores == 4:
				audio4Lock = true
				$GUI.alternarIconeAudio('4', audio4Lock)

func respawnar(body):
	body.respawnar(Vector2(0,-36), 1)

func _input(_event):
	if Input.is_action_just_pressed("toggleMutarInstrumentoAcompanhamento"):
		audio0Lock = !audio0Lock
	if Input.is_action_just_pressed("toggleMutarInstrumento1"):
		audio1Lock = !audio1Lock
		$GUI.alternarIconeAudio('1', audio1Lock)
	if Input.is_action_just_pressed("toggleMutarInstrumento2"):
		audio2Lock = !audio2Lock
		$GUI.alternarIconeAudio('2', audio2Lock)
	if Input.is_action_just_pressed("toggleMutarInstrumento3"):
		audio3Lock = !audio3Lock
		$GUI.alternarIconeAudio('3', audio3Lock)
	if Input.is_action_just_pressed("toggleMutarInstrumento4"):
		audio4Lock = !audio4Lock
		$GUI.alternarIconeAudio('4', audio4Lock)

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
		if not audio0Lock:
			$Audios/Baixo.tocarAudio('baixo', notasBaixo[indexBaixo])
		indexBaixo += 1
	
func tocarInstrumentoJogadoresAusentes():
	var numJogadores = $Jogadores.get_child_count()
	if indexBaixo%4 == 1:
		if not audio1Lock:
			$Audios/Xilofone1.tocarAudio('xilofone2', notasXilofone1[indexXilofone])
		if indexXilofone < 8:
			moverMarcador('xilofone1')
		elif indexXilofone == 8:
			$Marcadores/Player1.queue_free()
			$GUI/Control/Player1/PlayerMarcador1.visible = false
	elif indexBaixo%4 == 2:
		if not audio3Lock:
			$Audios/Pandeiro1.tocarAudio('pandeiro', '')
		if indexXilofone < 8:
			moverMarcador('pandeiro1')
		elif indexXilofone == 8:
			$Marcadores/Player3.queue_free()
			$GUI/Control/Player3/PlayerMarcador3.visible = false
	elif indexBaixo%4 == 3:
		if not audio2Lock:
			$Audios/Xilofone2.tocarAudio('xilofone2', notasXilofone2[indexXilofone])
		if indexXilofone < 8:
			moverMarcador('xilofone2')
		elif indexXilofone == 8:
			$Marcadores/Player2.queue_free()
			$GUI/Control/Player2/PlayerMarcador2.visible = false
		indexXilofone += 1
	elif indexBaixo%4 == 0:
		if not audio4Lock:
			$Audios/Pandeiro2.tocarAudio('pandeiro', '')
		if indexXilofone < 8:
			moverMarcador('pandeiro2')
		elif indexXilofone == 8: 
			$Marcadores/Player4.queue_free()
			$GUI/Control/Player4/PlayerMarcador4.visible = false

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
	elif marcador == 'pandeiro1':
		$Marcadores/Player3.global_position = posMarcadorPandeiro1[indexMarcadorXilofone]
	elif marcador == 'pandeiro2':
		$Marcadores/Player4.global_position = posMarcadorPandeiro2[indexMarcadorXilofone]
		indexMarcadorXilofone += 1
	
