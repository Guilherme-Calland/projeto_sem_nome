extends "res://scripts/estagios/RodarEstagio.gd"

var posicoesRespawn = [Vector2(-255,-130), Vector2(286, 138), Vector2(1023, 507), Vector2(1986, 28)]
var posicoesCamera = [Vector2(95, -150), Vector2(660, 300), Vector2(1265, 285), Vector2(2440,-223)]
var zIndexesRespawn = [1,1,3,1]
var gameLocalIndex = 0
var engatilhouAudios = false

var posicoesMarcadorXilofone = [
	Vector2(2111- 59, -240-17),
	Vector2(2161- 59, -240-17),
	Vector2(2111- 59, -190-17),
	Vector2(2161- 59, -190-17)
]

var posicoesMarcadorXilofone2 = [
	Vector2(2112, -81 ),
	Vector2(2080, -96 ),
	Vector2(2049, -81 ),
	Vector2(2080, -65 ),
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
var indexXilofone = 0

func _process(_delta):
	if gameLocalIndex == 2:
		$Cenario/Controller.visible = false
		$Cenario/Controller2.visible = true
	if gameLocalIndex == 3:
		$Cenario/Controller2.visible = false
		$Cenario/Controller3.visible = true
		$Cenario/Controller4.visible = true
	if gameLocalIndex == 4:
		$Cenario/Controller3.visible = false
		$Cenario/Controller4.visible = false
		$Cenario/Auxilios.visible = true
	
func _ready():
	$Camera2D.global_position = posicoesCamera[gameLocalIndex]
	gameLocalIndex += 1

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
		engatilhouAudios = true

func _on_AuxiliarAudio700BPM_finished():
	$Audios/AuxiliarAudio700BPM.play()
	moverMarcadorBumbo()
	indexBumbo = (indexBumbo + 1)%8
	var numeroDeJogadores = $Jogadores.get_child_count()
	if (indexBumbo + 1)%2 == 0:
		#caso queiramos que o jogo toque as partes que estao faltando, podemos descomentar
#		if indexIntrumento == 1 and numeroDeJogadores < 2 and engatilhouAudios:
#			$Audios/Player2SubstituteAudio.tocarAudio('pandeiro', '')
#		if indexIntrumento == 3 and numeroDeJogadores < 3 and engatilhouAudios:
#			$Audios/Player3SubstituteAudio.tocarAudio('pandeiro', '')
		moverMarcadoresInstrumento()
		indexIntrumento = (indexIntrumento + 1)%4
	if (indexBumbo + 1)%8 == 0:
		indexXilofone = (indexXilofone + 1)%4
	if indexBumbo == 6 and numeroDeJogadores < 4 and engatilhouAudios:
#		caso queiramos que o jogo toque as partes que estao faltando, podemos descomentar
#		$Audios/Player4SubstituteAudio.tocarAudio('bumbo', '')
		pass
	
func moverMarcadorBumbo():
	$Cenario/Auxilios/AuxilioBumbo/Marcador.global_position = posicoesMarcadorBumbo[indexBumbo] + Vector2(417, -222)

func moverMarcadoresInstrumento():
	$Cenario/Auxilios/AuxilioXilofone/Marcador.global_position = posicoesMarcadorXilofone[indexIntrumento]
	$Cenario/Auxilios/AuxilioXilofone/Marcador2.global_position = posicoesMarcadorXilofone2[indexXilofone]
	$Cenario/Auxilios/AuxilioPandeiro1/Marcador.global_position = posicoesMarcadorPandeiro1[indexIntrumento] + Vector2(138, -109)
	$Cenario/Auxilios/AuxilioPandeiro2/Marcador.global_position = posicoesMarcadorPandeiro2[indexIntrumento] + Vector2(157, -84)
