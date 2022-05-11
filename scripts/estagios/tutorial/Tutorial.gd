extends "res://scripts/estagios/RodarEstagio.gd"

var posicoesRespawn = [Vector2(-255,-130), Vector2(286, 138), Vector2(1023, 507), Vector2(1986, 28)]
var posicoesCamera = [Vector2(95, -150), Vector2(660, 300), Vector2(1265, 285), Vector2(2440,-223)]
var zIndexesRespawn = [1,1,3,1]
var gameLocalIndex = 0
var engatilhouAudios = false

var audioLock0 = false
var audioLock1 = false
var audioLock2 = false
var audioLock3 = false
var audioLock4 = false

var notasXilofone = ['C6', 'A5', 'F5', 'G5', 'C6', 'A5', 'F5', 'GSH5']
var notasPiano = [
	'C4', 'G4', 'E4', 'G4',
	'A3', 'G4', 'E4', 'D4',
	'F3', 'C4', 'E4', 'D4',
	'G3', 'C4', 'E4', 'D4',
	'C4', 'G4', 'F4', 'E4',
	'A3', 'G3', 'E3', 'G3',
	'F4', 'E4', 'D4', 'C4',
	'GSH3', 'G3', 'F3', 'G3'
	]
var indexPiano = 0
var indexXilofone = 0

var posicoesMarcadorXilofone = [
	Vector2(2111- 59, -240-17),
	Vector2(2161- 59, -240-17),
	Vector2(2111- 59, -190-17),
	Vector2(2161- 59, -190-17)
]

var posicoesMarcadorXilofone2 = [
	Vector2(2112, -81 - 5 ),
	Vector2(2080, -96 - 5),
	Vector2(2049, -81 - 5),
	Vector2(2080, -65 - 5),
]

var posicoesMarcadorPandeiro1 = [
	Vector2(2111,-190),
	Vector2(2161, -190),
	Vector2(2111, -140),
	Vector2(2161, -140),
]

var posicoesMarcadorPandeiro2 = [
	Vector2(2249, -311),
	Vector2(2299, -311),
	Vector2(2249, -261),
	Vector2(2299, -261)
]

var posicoesMarcadorBumbo = [
	Vector2(2112,-240),
	Vector2(2161, -240),
	Vector2(2211, -240),
	Vector2(2260, -240),
	Vector2(2111, -190),
	Vector2(2161, -190),
	Vector2(2211, -190),
	Vector2(2260, -190),
]

var indexBumbo = 0
var indexIntrumento = 0
var indexMarcadorXilofone = 1

func _process(_delta):
	if gameLocalIndex == 2:
		$Cenario/Controller.visible = false
		$Cenario/Controller2.visible = true
	if gameLocalIndex == 3:
		$Cenario/Controller2.visible = false
		$Cenario/Controller4.visible = true
	if gameLocalIndex == 4:
		$Cenario/Controller4.visible = false
		$Cenario/Auxilios.visible = true

func _input(_event):
	if Input.is_action_just_pressed("toggleMutarInstrumentoAcompanhamento"):
		audioLock0 = !audioLock0
	if Input.is_action_just_pressed("toggleMutarInstrumento1"):
		audioLock1 = !audioLock1
		$Cenario/Auxilios/AuxilioXilofone/AudioOff.visible = audioLock1
		$Cenario/Auxilios/AuxilioXilofone/AudioOn.visible = !audioLock1
	if Input.is_action_just_pressed("toggleMutarInstrumento2"):
		audioLock2 = !audioLock2
		$Cenario/Auxilios/AuxilioPandeiro1/AudioOff.visible = audioLock2
		$Cenario/Auxilios/AuxilioPandeiro1/AudioOn.visible = !audioLock2
	if Input.is_action_just_pressed("toggleMutarInstrumento3"):
		audioLock3 = !audioLock3
		$Cenario/Auxilios/AuxilioPandeiro2/AudioOff.visible = audioLock3
		$Cenario/Auxilios/AuxilioPandeiro2/AudioOn.visible = !audioLock3
	if Input.is_action_just_pressed("toggleMutarInstrumento4"):
		audioLock4 = !audioLock4
		$Cenario/Auxilios/AuxilioBumbo/AudioOff.visible = audioLock4
		$Cenario/Auxilios/AuxilioBumbo/AudioOn.visible = !audioLock4

func _ready():
	$Camera2D.global_position = posicoesCamera[gameLocalIndex]
	gameLocalIndex += 1
	var numJogadores = $Jogadores.get_child_count()
	audioLock1 = true
	$Cenario/Auxilios/AuxilioXilofone/AudioOff.visible = audioLock1
	$Cenario/Auxilios/AuxilioXilofone/AudioOn.visible = !audioLock1
	if numJogadores >= 2:
		audioLock2 = true
		$Cenario/Auxilios/AuxilioPandeiro1/AudioOff.visible = audioLock1
		$Cenario/Auxilios/AuxilioPandeiro1/AudioOn.visible = !audioLock1
	if numJogadores >= 3:
		audioLock3 = true
		$Cenario/Auxilios/AuxilioPandeiro2/AudioOff.visible = audioLock1
		$Cenario/Auxilios/AuxilioPandeiro2/AudioOn.visible = !audioLock1
	if numJogadores >= 4:
		audioLock4 = true
		$Cenario/Auxilios/AuxilioBumbo1/AudioOff.visible = audioLock1
		$Cenario/Auxilios/AuxilioBumbo1/AudioOn.visible = !audioLock1

func respawnar(body):
	body.respawnar(posicoesRespawn[gameLocalIndex- 1], zIndexesRespawn[gameLocalIndex - 1])

func onMoverCameraGatilho(body):
	var jogadorObservado = $Jogadores.get_child(body.indexJogador)
	if jogadorObservado.acimaDoChao():
		moverCamera()

func moverCamera():
	$Camera2D.global_position = posicoesCamera[gameLocalIndex]
	$Gatilhos/MoverCamera.get_child(0).queue_free()
	gameLocalIndex += 1
	if gameLocalIndex == 4:
		$Audios/AuxiliarAudio700BPM.play()

func _on_AuxiliarAudio700BPM_finished():
	$Audios/AuxiliarAudio700BPM.play()
	moverMarcadorBumbo()
	indexBumbo = (indexBumbo + 1)%8
	if (indexBumbo - 1) % 2 == 0:
		if not audioLock0:
			$Audios/AudioAcompanhamento.tocarAudio("grand piano", notasPiano[indexPiano])
		indexPiano = (indexPiano + 1)%32
	if (indexBumbo - 1)%8 == 0:
		if not audioLock1:
			$Audios/Player1SubstituteAudio.tocarAudio('xilofone2', notasXilofone[indexXilofone])
		indexXilofone = (indexXilofone + 1)%8
	if (indexBumbo + 1)%2 == 0:
		if indexIntrumento == 1 and not audioLock2:
			$Audios/Player2SubstituteAudio.tocarAudio('pandeiro', '')
		if indexIntrumento == 3 and not audioLock3:
			$Audios/Player3SubstituteAudio.tocarAudio('pandeiro', '')
		moverMarcadoresInstrumento()
		indexIntrumento = (indexIntrumento + 1)%4
	if (indexBumbo + 1)%8 == 0:
		indexMarcadorXilofone = (indexMarcadorXilofone + 1)%4
	if indexBumbo == 6 and not audioLock4:
		$Audios/Player4SubstituteAudio.tocarAudio('bumbo', '')
		pass
	
func moverMarcadorBumbo():
	$Cenario/Auxilios/AuxilioBumbo/Marcador.global_position = posicoesMarcadorBumbo[indexBumbo] + Vector2(417, -222)

func moverMarcadoresInstrumento():
	$Cenario/Auxilios/AuxilioXilofone/Marcador.global_position = posicoesMarcadorXilofone[indexIntrumento]
	$Cenario/Auxilios/AuxilioXilofone/Marcador2.global_position = posicoesMarcadorXilofone2[indexMarcadorXilofone]
	$Cenario/Auxilios/AuxilioPandeiro1/Marcador.global_position = posicoesMarcadorPandeiro1[indexIntrumento] + Vector2(138, -109)
	$Cenario/Auxilios/AuxilioPandeiro2/Marcador.global_position = posicoesMarcadorPandeiro2[indexIntrumento] + Vector2(157, -84)
